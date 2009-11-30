;; Exercise 2.76

;; explicit dispatch
;; Adding new type:
;; Directly make constructors for new type, and also define common operations
;; on this new type. After that add the operations for the new type to the
;; generic interface procedures which dispach on types.
;; Adding new operations:
;; Add operations under each type and also add it in the generic interface.

;; data-directed
;; Adding new type:
;; Just make a new package for the new type with its operations.
;; Adding new operation:
;; Need to make the new operation for each type in each package.

;; message-passing
;; Adding new type:
;; Directly make new constuctor for the new type, and define the operations
;; inside the constructor.
;; Adding new operation:
;; Add new operation in each type constructor.

;; Data-directed and message-passing are most appropriate for a system in which
;; new types must often be added. Because there is no need to change the code in
;; the existing types.

;; Data-directed and message-passing are most appropriate for a system in which
;; new operations must often be added. They both need add the new operation
;; under each type. For exlicit dispatch, new operation needs to be added in
;; each type and also in the generic interface procedure. However, one
;; shortcoming of message-passing is that it permits only generic procedures of
;; one argument.

