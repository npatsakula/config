import argparse as arg

parser = arg.ArgumentParser(description='WireGuard config generator.')

# Server credentials:
parser.add_argument('--server-public', required=True, metavar='KEY', dest='public', help='Server public key.')
parser.add_argument('--server-address', required=True, metavar='IPV4:PORT', dest='server', help='Server address.')

# Self credentials:
parser.add_argument('--self-address', required=True, metavar='IPV4/MASK', dest='self', help='Self address in WireGuard network.')
parser.add_argument('--self-private', required=True, metavar='KEY', dest='private', help='Self private key.')
args = parser.parse_args()

result = f"""
[Interface]
Address = {args.self}
PrivateKey = {args.private}
DNS = 1.1.1.1

[Peer]
PublicKey = {args.public}
Address = {args.server}
AllowedIPs = 0.0.0.0/0, ::/0
"""

print(result)
