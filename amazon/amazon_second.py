# string S with (  or )
# get two strings with same number of ( and ), the total doesnt need to match
# example (()) = (( and ))
# example (()))))))) = (( and ))))))))
# example ((()()))))))) = ((()( and ))))))))
# example ((()((((((() = (( and ()((((((()
# example ))) = ))) and
# return size of the first string
def solution(S, should_be):
    left = ''
    right = ''
    opening = 0
    closing = 0
    for i in range(len(S)):
        if opening == closing:
            heading_char = S[len(left)]
            left += heading_char
            if heading_char == '(':
                opening += 1
        else:
            leading_char = S[len(S) - 1 - len(right)]
            right = leading_char + right
            if leading_char == ')':
                closing += 1

    if opening > closing and left[-1] == '(':
        right = left[-1] + right
        left = left[:-1]

    print(f'{S} = {left} and {right}')
    print('should_be')
    print(should_be)
    print('\n')

    return len(left)


solution('(())', '(()) = (( and ))')
solution('(())))))))', '(()))))))) = (()))))) and ))')
solution('((()())))))))', '((()()))))))) = ((()()))) and ))))')
solution('((()((((((()', '((()((((((() = (( and ()((((((()')
solution(')))', '))) = ))) and ')
solution('(((', '((( =  and (((')
solution('((())))', '((()))) = ((() and )))')
solution('(', '( =  and (')
solution(')', ') = ) and')
