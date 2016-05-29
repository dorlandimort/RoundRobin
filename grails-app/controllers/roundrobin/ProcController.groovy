package roundrobin

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProcController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Proc.list(params), model: [procCount: Proc.count()]
    }

    def show(Proc proc) {
        respond proc
    }

    def create() {
        respond new Proc(params)
    }

    @Transactional
    def save(Proc proc) {
        if (proc == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (proc.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond proc.errors, view: 'create'
            return
        }

        proc.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proc.label', default: 'Proc'), proc.id])
                redirect proc
            }
            '*' { respond proc, [status: CREATED] }
        }
    }

    def edit(Proc proc) {
        respond proc
    }

    @Transactional
    def update(Proc proc) {
        if (proc == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (proc.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond proc.errors, view: 'edit'
            return
        }

        proc.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'proc.label', default: 'Proc'), proc.id])
                redirect proc
            }
            '*' { respond proc, [status: OK] }
        }
    }

    @Transactional
    def delete(Proc proc) {

        if (proc == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        proc.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'proc.label', default: 'Proc'), proc.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proc.label', default: 'Proc'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
