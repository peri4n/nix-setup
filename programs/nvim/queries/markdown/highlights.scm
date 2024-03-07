;extends

; Headings
(atx_heading
  (atx_h1_marker) @markup.heading.1.symbol
  (#set! conceal "◆"))

(atx_heading
  (atx_h2_marker) @markup.heading.2.symbol
  (#set! conceal "◈"))

(atx_heading
  (atx_h3_marker) @markup.heading.3.symbol
  (#set! conceal "◇"))

(atx_heading
  (atx_h4_marker) @markup.heading.4.symbol
  (#set! conceal "❖"))

(atx_heading
  (atx_h5_marker) @markup.heading.5.symbol
  (#set! conceal "⟡"))

; Checkboxes
((task_list_marker_unchecked)
    @markup.todo.unchecked.conceal
    (#offset! @markup.todo.unchecked.conceal 0 0 0 0)
    (#set! conceal ""))

((task_list_marker_checked)
    @markup.todo.checked.conceal
    (#offset! @markup.todo.checked.conceal 0 0 0 0)
    (#set! conceal ""))

; Bullets (using custom offset directive)
([(list_marker_minus) (list_marker_plus) (list_marker_star)]
  @punctuation.special
  (#offset-first-n! @punctuation.special 1)
  (#set! conceal "•"))
(list
  (list_item
    (list
      (list_item
        ([(list_marker_minus) (list_marker_plus) (list_marker_star)]
         @punctuation.special
         (#offset-first-n! @punctuation.special 1)
         (#set! conceal "∘"))))))
(list
  (list_item
    (list
      (list_item
        (list
          (list_item
            ([(list_marker_minus) (list_marker_plus) (list_marker_star)]
             @punctuation.special
             (#offset-first-n! @punctuation.special 1)
             (#set! conceal "▪"))))))))
(list
  (list_item
    (list
      (list_item
        (list
          (list_item
            (list
              (list_item
                ([(list_marker_minus) (list_marker_plus) (list_marker_star)]
                 @punctuation.special
                 (#offset-first-n! @punctuation.special 1)
                 (#set! conceal "▫"))))))))))
