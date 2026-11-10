# Network Infrastructure Lab

Documentation and examples for IP addressing, network segmentation and troubleshooting.

## IP Address Plan

| Department | VLAN | Subnet | Purpose |
|---|---:|---|---|
| Management | 10 | 192.168.10.0/24 | Network equipment |
| Office | 20 | 192.168.20.0/24 | Office computers |
| Warehouse | 30 | 192.168.30.0/24 | Warehouse devices |
| Guest | 40 | 192.168.40.0/24 | Guest wireless |
| Servers | 50 | 192.168.50.0/24 | Internal servers |

## Network Concepts

- IPv4 addressing and subnetting
- VLAN configuration
- DHCP and DNS
- LAN and WLAN
- Routing
- Network segmentation
- Basic firewall rules

## Troubleshooting Commands

Check network configuration:

```powershell
ipconfig /all
```

Test network connectivity:

```powershell
ping 192.168.10.1
```

Check DNS resolution:

```powershell
nslookup example.com
```

Trace the network route:

```powershell
tracert example.com
```

## Network Design Notes

- Separate guest devices from internal networks.
- Assign appropriate IP ranges to each VLAN.
- Configure DHCP scopes for each subnet.
- Document network devices and connections.
- Restrict communication between network segments where appropriate.

All IP addresses are examples for a private test environment.
