from flask import Flask, request, jsonify

app = Flask(__name__)

def fibonacci(n):
    """
    Returns the nth Fibonacci number using an iterative approach.
    """
    if n == 0:
        return 0
    elif n == 1:
        return 1
    a, b = 0, 1
    for _ in range(2, n + 1):
        a, b = b, a + b
    return b

@app.route('/fibonacci', methods=['GET'])
def get_fibonacci():
    """
    Endpoint to retrieve the nth Fibonacci number. Expects 'n' as a non-negative integer query parameter.
    """
    n = request.args.get('n', default=1, type=int)
    if n < 0:
        return jsonify({'error': 'Input must be a non-negative integer'}), 400
    result = fibonacci(n)
    return jsonify({'Fibonacci number': result})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')