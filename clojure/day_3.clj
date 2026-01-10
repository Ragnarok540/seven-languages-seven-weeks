;; • Use refs to create a vector of accounts in memory. Create debit
;; and credit functions to change the balance of an account.

(def account1 (ref 50))
(def account2 (ref 100))

(defn credit [account value]
    (dosync
        (alter account + value)
        value))

(defn debit [account value]
    (dosync
        (alter account - value)
        value))

(defn transfer-money [a1 a2 value]
    (dosync
        (alter a1 - value)
        (alter a2 + value)
        value))

(println @account1 @account2)
(credit account1 100)
(println @account1 @account2)
(debit account2 50)
(println @account1 @account2)
(transfer-money account1 account2 50)
(println @account1 @account2)

;; Sleeping Barber problem will be solved in Erlang.
;; See erlang/day_3_clojure.erl
