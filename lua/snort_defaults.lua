---------------------------------------------------------------------------
-- Snort++ defaults
--
-- include in your snort.lua with a dofile statement
-- after you set HOME_NET and EXTERNAL_NET
--
-- use these by assignment, eg
--     ftp_server = default_ftp_server
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Set paths, ports, and nets:
--
-- variables with 'PATH' in the name are vars
-- variables with 'PORT' in the name are portvars
-- variables with 'NET' in the name are ipvars
-- variables with 'SERVER' in the name are ipvars
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- default paths
---------------------------------------------------------------------------
-- Path to your rules files (this can be a relative path)

RULE_PATH = '../rules'
BUILTIN_RULE_PATH = '../preproc_rules'
PLUGIN_RULE_PATH = '../so_rules'

-- If you are using reputation preprocessor set these
WHITE_LIST_PATH = '../lists'
BLACK_LIST_PATH = '../lists'

---------------------------------------------------------------------------
-- default networks
---------------------------------------------------------------------------

-- List of DNS servers on your network 
DNS_SERVERS = HOME_NET

-- List of SMTP servers on your network
SMTP_SERVERS = HOME_NET

-- List of web servers on your network
HTTP_SERVERS = HOME_NET

-- List of sql servers on your network 
SQL_SERVERS = HOME_NET

-- List of telnet servers on your network
TELNET_SERVERS = HOME_NET

-- List of ssh servers on your network
SSH_SERVERS = HOME_NET

-- List of ftp servers on your network
FTP_SERVERS = HOME_NET

-- List of sip servers on your network
SIP_SERVERS = HOME_NET

-- other variables, these should not be modified
AIM_SERVERS =
[[
64.12.24.0/23
64.12.28.0/23
64.12.161.0/24
64.12.163.0/24
64.12.200.0/24
205.188.3.0/24
205.188.5.0/24
205.188.7.0/24
205.188.9.0/24
205.188.153.0/24
205.188.179.0/24
205.188.248.0/24
]]

---------------------------------------------------------------------------
-- default ports
---------------------------------------------------------------------------
-- List of ports you run web servers on
HTTP_PORTS =
[[
    80 81 311 383 591 593 901 1220 1414 1741 1830 2301 2381 2809 3037 3128
    3702 4343 4848 5250 6988 7000 7001 7144 7145 7510 7777 7779 8000 8008
    8014 8028 8080 8085 8088 8090 8118 8123 8180 8181 8243 8280 8300 8800
    8888 8899 9000 9060 9080 9090 9091 9443 9999 11371 34443 34444 41080
    50002 55555 
]]

-- List of ports you want to look for SHELLCODE on.
SHELLCODE_PORTS = ' !80'

-- List of ports you might see oracle attacks on
ORACLE_PORTS = ' 1024:'

-- List of ports you want to look for SSH connections on:
SSH_PORTS = ' 22'

-- List of ports you run ftp servers on
FTP_PORTS = ' 21 2100 3535'

-- List of ports you run SIP servers on
SIP_PORTS = ' 5060 5061 5600'

MAIL_PORTS = ' 110 143'

-- List of file data ports for file inspection
FILE_DATA_PORTS = HTTP_PORTS .. MAIL_PORTS

-- List of GTP ports for GTP preprocessor
GTP_PORTS = ' 2123 2152 3386'

RPC_PORTS = 
    ' 111 32770 32771 32772 32773 32774 32775 32776 32777 32778 32779'

---------------------------------------------------------------------------
-- default ftp server
---------------------------------------------------------------------------

ftp_default_commands =
[[
    ABOR ACCT ADAT ALLO APPE AUTH CCC CDUP CEL CLNT CMD CONF CWD DELE ENC
    EPRT EPSV ESTA ESTP FEAT HELP LANG LIST LPRT LPSV MACB MAIL MDTM MIC
    MKD MLSD MLST MODE NLST NOOP OPTS PASS PASV PBSZ PORT PROT PWD QUIT
    REIN REST RETR RMD RNFR RNTO SDUP SITE SIZE SMNT STAT STOR STOU STRU
    SYST TEST TYPE USER XCUP XCRC XCWD XMAS XMD5 XMKD XPWD XRCP XRMD XRSQ
    XSEM XSEN XSHA1 XSHA256
]]

ftp_default_data_chan_cmds = 
[[
    PORT PASV LPRT LPSV EPRT EPSV
]]

ftp_default_data_xfer_cmds =
[[
    RETR STOR STOU APPE LIST NLST
]]

ftp_default_file_put_cmds = 
[[
    STOR STOU
]]

ftp_default_file_get_cmds = 
[[
    RETR
]]

ftp_default_login_cmds = 
[[
    USER PASS
]]

ftp_default_encr_cmds = 
[[
    AUTH
]]

ftp_format_commands = 
[[ 
    ACCT ADAT ALLO APPE AUTH CEL CLNT CMD CONF CWD DELE ENC EPRT EPSV ESTP
    HELP LANG LIST LPRT MACB MAIL MDTM MIC MKD MLSD MLST MODE NLST OPTS
    PASS PBSZ PORT PROT REST RETR RMD RNFR RNTO SDUP SITE SIZE SMNT STAT
    STOR STRU TEST TYPE USER XCRC XCWD XMAS XMD5 XMKD XRCP XRMD XRSQ XSEM
    XSEN XSHA1 XSHA256
]]

ftp_command_specs =
{
    { command = 'ABOR', length = 0 },
    { command = 'CCC', length = 0 },
    { command = 'CDUP', length = 0 },
    { command = 'ESTA', length = 0 },
    { command = 'FEAT', length = 0 },
    { command = 'LPSV', length = 0 },
    { command = 'NOOP', length = 0 },
    { command = 'PASV', length = 0 },
    { command = 'PWD', length = 0 },
    { command = 'QUIT', length = 0 },
    { command = 'REIN', length = 0 },
    { command = 'SYST', length = 0 },
    { command = 'XCUP', length = 0 },
    { command = 'XPWD', length = 0 },

    { command = 'APPE', length = 200 },
    { command = 'CMD', length = 200 },
    { command = 'HELP', length = 200 },
    { command = 'NLST', length = 200 },
    { command = 'RETR', length = 200 },
    { command = 'RNFR', length = 200 },
    { command = 'STOR', length = 200 },
    { command = 'STOU', length = 200 },
    { command = 'XMKD', length = 200 },

    { command = 'CWD', length = 256 },
    { command = 'RNTO', length = 256 },
    { command = 'SIZE', length = 512 },

    { command = 'ALLO', length = 200, format = '< int [ char R int ] >' },
    { command = 'PORT', length = 400, format = '< host_port >' },

    { command = 'EPSV', format = '< [ { char 12 | char A char L char L } ] >' },
    { command = 'MACB', format = '< string >' },
    { command = 'MDTM', format = '< [ date nnnnnnnnnnnnnn[.n[n[n]]] ] string >' },
    { command = 'MODE', format = '< char ASBCZ >' },
    { command = 'PROT', format = '< char CSEP >' },
    { command = 'STRU', format = '< char FRPO [ string ] >' },
    { command = 'TYPE', 
      format = '< { char AE [ char NTC ] | char I | char L [ number ] } >' }
}

default_ftp_server =
{
    def_max_param_len = 100,

    encrypted_traffic = false,
    check_encrypted = true,
    print_cmds = false,
    telnet_cmds = true,
    ignore_telnet_erase_cmds = true,
    ignore_data_chan = true,

    ftp_cmds = ftp_default_commands,
    data_chan_cmds = ftp_default_data_chan_cmds,
    data_xfer_cmds = ftp_default_data_xfer_cmds,
    file_put_cmds = ftp_default_file_put_cmds,
    file_get_cmds = ftp_default_file_get_cmds,
    login_cmds = ftp_default_login_cmds,
    encr_cmds = ftp_default_encr_cmds,
    chk_str_fmt = ftp_format_commands,
    cmd_validity = ftp_command_specs
}

---------------------------------------------------------------------------
-- default http profiles
---------------------------------------------------------------------------

http_profile_default = 
{
    profile_type = 'default',
    server_flow_depth = 300,
    client_flow_depth = 300,
    post_depth = -1,
    chunk_length = 500000,
    ascii = true,
    multi_slash = true,
    directory = true,
    webroot = true,
    double_decode = true,
    u_encode = true,
    bare_byte = true,
    iis_unicode = true,
    iis_backslash = true,
    iis_delimiter = true,
    apache_whitespace = true,
    non_strict = true,
    normalize_utf = true,
    normalize_javascript = false,
    max_header_length = 0,
    max_headers = 0,
    max_spaces = 200,
    max_javascript_whitespaces = 200,
    whitespace_chars ='0x9 0xb 0xc 0xd'
}

http_profile_apache = 
{
    profile_type = 'apache',
    server_flow_depth = 300,
    client_flow_depth = 300,
    post_depth = -1,
    chunk_length = 500000,
    ascii = true,
    multi_slash = true,
    directory = true,
    webroot = true,
    utf_8 = true,
    apache_whitespace = true,
    non_strict = true,
    normalize_utf = true,
    normalize_javascript = false,
    max_header_length = 0,
    max_headers = 0,
    max_spaces = 200,
    max_javascript_whitespaces = 200,
    whitespace_chars ='0x9 0xb 0xc 0xd'
}

http_profile_iis = 
{
    profile_type = 'iis',
    server_flow_depth = 300,
    client_flow_depth = 300,
    post_depth = -1,
    chunk_length = 500000,
    ascii = true,
    multi_slash = true,
    directory = true,
    webroot = true,
    double_decode = false,
    u_encode = true,
    bare_byte = true,
    iis_unicode = true,
    iis_backslash = true,
    iis_delimiter = true,
    apache_whitespace = true,
    non_strict = true,
    normalize_utf = true,
    normalize_javascript = false,
    max_header_length = 0,
    max_headers = 0,
    max_spaces = 200,
    max_javascript_whitespaces = 200,
    whitespace_chars ='0x9 0xb 0xc 0xd'
}

http_profile_iis_40 = 
{
    profile_type = 'iis_40',
    server_flow_depth = 300,
    client_flow_depth = 300,
    post_depth = -1,
    chunk_length = 500000,
    ascii = true,
    multi_slash = true,
    directory = true,
    webroot = true,
    double_decode = true,
    u_encode = true,
    bare_byte = true,
    iis_unicode = true,
    iis_backslash = true,
    iis_delimiter = true,
    apache_whitespace = true,
    non_strict = true,
    normalize_utf = true,
    normalize_javascript = false,
    max_header_length = 0,
    max_headers = 0,
    max_spaces = 200,
    max_javascript_whitespaces = 200,
    whitespace_chars ='0x9 0xb 0xc 0xd'
}

http_profile_iis_50 = 
{
    profile_type = 'iis_50',
    server_flow_depth = 300,
    client_flow_depth = 300,
    post_depth = -1,
    chunk_length = 500000,
    ascii = true,
    multi_slash = true,
    directory = true,
    webroot = true,
    double_decode = true,
    u_encode = true,
    bare_byte = true,
    iis_unicode = true,
    iis_backslash = true,
    iis_delimiter = true,
    apache_whitespace = true,
    non_strict = true,
    normalize_utf = true,
    normalize_javascript = false,
    max_header_length = 0,
    max_headers = 0,
    max_spaces = 200,
    max_javascript_whitespaces = 200,
    whitespace_chars ='0x9 0xb 0xc 0xd'
}

---------------------------------------------------------------------------
-- default wizard
---------------------------------------------------------------------------

http_methods =  -- build from default_http_methods
{
    'GET', 'POST', 'PUT', 'SEARCH', 'MKCOL', 'COPY', 'MOVE', 'LOCK', 'UNLOCK',
    'NOTIFY', 'POLL', 'BCOPY', 'BDELETE', 'BMOVE', 'LINK', 'UNLINK', 'OPTIONS',
    'HEAD', 'DELETE', 'TRACE', 'TRACK', 'CONNECT', 'SOURCE', 'SUBSCRIBE',
    'UNSUBSCRIBE', 'PROPFIND', 'PROPPATCH', 'BPROPFIND', 'BPROPPATCH',
    'RPC_CONNECT', 'PROXY_SUCCESS', 'BITS_POST', 'CCM_POST', 'SMS_POST',
    'RPC_IN_DATA', 'RPC_OUT_DATA', 'RPC_ECHO_DATA'
}

ftp_commands =  -- build from ftp_default_commands
{
    'ABOR', 'ACCT', 'ADAT', 'ALLO', 'APPE', 'AUTH', 'CCC', 'CDUP', 'CEL',
    'CLNT', 'CMD', 'CONF', 'CWD', 'DELE', 'ENC', 'EPRT', 'EPSV', 'ESTA',
    'ESTP', 'FEAT', 'HELP', 'LANG', 'LIST', 'LPRT', 'LPSV', 'MACB', 'MAIL',
    'MDTM', 'MIC', 'MKD', 'MLSD', 'MLST', 'MODE', 'NLST', 'NOOP', 'OPTS',
    'PASS', 'PASV', 'PBSZ', 'PORT', 'PROT', 'PWD', 'QUIT', 'REIN', 'REST',
    'RETR', 'RMD', 'RNFR', 'RNTO', 'SDUP', 'SITE', 'SIZE', 'SMNT', 'STAT',
    'STOR', 'STOU', 'STRU', 'SYST', 'TEST', 'TYPE', 'USER', 'XCUP', 'XCRC',
    'XCWD', 'XMAS', 'XMD5', 'XMKD', 'XPWD', 'XRCP', 'XRMD', 'XRSQ', 'XSEM',
    'XSEN', 'XSHA1', 'XSHA256'
}

sip_methods =
{
    'INVITE', 'CANCEL', 'ACK', 'BYE', 'REGISTER', 'OPTIONS', 'REFER', 'SUBSCRIBE',
    'UPDATE', 'JOIN', 'INFO', 'MESSAGE', 'NOTIFY', 'PRACK'
}

isakmp_hex = { '?????????????????|01|', '?????????????????|10|' }

telnet_commands =
{
    '|FF F0|', '|FF F1|', '|FF F2|', '|FF F3|',
    '|FF F4|', '|FF F5|', '|FF F6|', '|FF F7|',
    '|FF F8|', '|FF F9|', '|FF FA|', '|FF FB|',
    '|FF FC|', '|FF FD|', '|FF FE|', '|FF FF|'
}

default_wizard =
{
    spells =
    {
        { service = 'ftp', proto = 'tcp', client_first = false,
          to_server = ftp_commands, to_client = { '220*FTP' } },

        { service = 'http', proto = 'tcp', client_first = true,
          to_server = http_methods, to_client = { 'HTTP/' } },

        { service = 'imap', proto = 'tcp', client_first = false,
          to_server = { 'LOGIN', 'AUTHENTICATE', 'STARTTLS' },
          to_client = { '**OK', '**BYE' } },

        { service = 'pop3', proto = 'tcp', client_first = false,
          to_server = { 'USER', 'APOP' },
          to_client = { '+OK', '-ERR' } },

        { service = 'sip', proto = 'tcp', client_first = true,
          to_server = sip_methods, to_client = { 'SIP/' } },

        { service = 'smtp', proto = 'tcp', client_first = false,
          to_server = { 'HELO', 'EHLO' },
          to_client = { '220*SMTP', '220*MAIL' } },

        { service = 'ssh', proto = 'tcp', client_first = true,
          to_server = { '*SSH' }, to_client = { '*SSH' } }
    },
    hexes =
    {
        { service = 'dcerpc', proto = 'tcp', client_first = true, 
          to_server = { '|05 00|' }, to_client = { '|05 00|' } },

        { service = 'dnp3', proto = 'tcp', client_first = true, 
          to_server = { '|05 64|' }, to_client = { '|05 64|' } },

        { service = 'isakmp',  proto = 'udp', client_first = true,
          to_server = isakmp_hex, to_client = isakmp_hex },
--[[
        { service = 'modbus', proto = 'tcp', client_first = true,
          to_server = { '??|0 0|' } },

        { service = 'rpc', proto = 'tcp', client_first = true,
          to_server = { '????|0 0 0 0 0 0 0 1|' },
          to_client = { '????|0 0 0 0 0 0 0 1|' } },
--]]
        { service = 'smb', proto = 'tcp', client_first = true,
          to_server = { '|FF|SMB' }, to_client = { '|FF|SMB' } },

        { service = 'smb', proto = 'udp', client_first = true,
          to_server = { '|FF|SMB' }, to_client = { '|FF|SMB' } },

        { service = 'ssl', proto = 'tcp', client_first = true,
          to_server = { '|16 03|' }, to_client = { '|16 03|' } },

        { service = 'telnet', proto = 'tcp', client_first = true,
          to_server = telnet_commands, to_client = telnet_commands },
    }
}

---------------------------------------------------------------------------
-- default references
---------------------------------------------------------------------------

references =
{
    { name = 'bugtraq',   url = 'http://www.securityfocus.com/bid/' },
    { name = 'cve',       url = 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=' },
    { name = 'arachNIDS', url = 'http://www.whitehats.com/info/IDS' },
    { name = 'osvdb',     url = 'http://osvdb.org/show/osvdb/' },
    { name = 'McAfee',    url = 'http://vil.nai.com/vil/content/v_' },
    { name = 'nessus',    url = 'http://cgi.nessus.org/plugins/dump.php3?id=' },
    { name = 'url',       url = 'http://' },
    { name = 'msb',       url = 'http://technet.microsoft.com/en-us/security/bulletin/' }
}

---------------------------------------------------------------------------
-- default classifications
---------------------------------------------------------------------------

classifications =
{
    { name = 'not-suspicious', priority = 3,
      text = 'Not Suspicious Traffic' },

    { name = 'unknown', priority = 3,
      text = 'Unknown Traffic' },

    { name = 'bad-unknown', priority = 2,
      text = 'Potentially Bad Traffic' },

    { name = 'attempted-recon', priority = 2,
      text = 'Attempted Information Leak' },

    { name = 'successful-recon-limited', priority = 2,
      text = 'Information Leak' },

    { name = 'successful-recon-largescale', priority = 2,
      text = 'Large Scale Information Leak' },

    { name = 'attempted-dos', priority = 2,
      text = 'Attempted Denial of Service' },

    { name = 'successful-dos', priority = 2,
      text = 'Denial of Service' },

    { name = 'attempted-user', priority = 1,
      text = 'Attempted User Privilege Gain' },

    { name = 'unsuccessful-user', priority = 1,
      text = 'Unsuccessful User Privilege Gain' },

    { name = 'successful-user', priority = 1,
      text = 'Successful User Privilege Gain' },

    { name = 'attempted-admin', priority = 1,
      text = 'Attempted Administrator Privilege Gain' },

    { name = 'successful-admin', priority = 1,
      text = 'Successful Administrator Privilege Gain' },

    { name = 'rpc-portmap-decode', priority = 2,
      text = 'Decode of an RPC Query' },

    { name = 'shellcode-detect', priority = 1,
      text = 'Executable code was detected' },

    { name = 'string-detect', priority = 3,
      text = 'A suspicious string was detected' },

    { name = 'suspicious-filename-detect', priority = 2,
      text = 'A suspicious filename was detected' },

    { name = 'suspicious-login', priority = 2,
      text = 'An attempted login using a suspicious username was detected' },

    { name = 'system-call-detect', priority = 2,
      text = 'A system call was detected' },

    { name = 'tcp-connection', priority = 4,
      text = 'A TCP connection was detected' },

    { name = 'trojan-activity', priority = 1,
      text = 'A Network Trojan was detected' },

    { name = 'unusual-client-port-connection', priority = 2,
      text = 'A client was using an unusual port' },

    { name = 'network-scan', priority = 3,
      text = 'Detection of a Network Scan' },

    { name = 'denial-of-service', priority = 2,
      text = 'Detection of a Denial of Service Attack' },

    { name = 'non-standard-protocol', priority = 2,
      text = 'Detection of a non-standard protocol or event' },

    { name = 'protocol-command-decode', priority = 3,
      text = 'Generic Protocol Command Decode' },

    { name = 'web-application-activity', priority = 2,
      text = 'access to a potentially vulnerable web application' },

    { name = 'web-application-attack', priority = 1,
      text = 'Web Application Attack' },

    { name = 'misc-activity', priority = 3,
      text = 'Misc activity' },

    { name = 'misc-attack', priority = 2,
      text = 'Misc Attack' },

    { name = 'icmp-event', priority = 3,
      text = 'Generic ICMP event' },

    { name = 'inappropriate-content', priority = 1,
      text = 'Inappropriate Content was Detected' },

    { name = 'policy-violation', priority = 1,
      text = 'Potential Corporate Privacy Violation' },

    { name = 'default-login-attempt', priority = 2,
      text = 'Attempt to login by a default username and password' },

    { name = 'sdf', priority = 2,
      text = 'Senstive Data' },

    { name = 'file-format', priority = 1,
      text = 'Known malicious file or file based exploit' },

    { name = 'malware-cnc', priority = 1,
      text = 'Known malware command and control traffic' },

    { name = 'client-side-exploit', priority = 1,
      text = 'Known client side exploit attempt' }
}

---------------------------------------------------------------------------
-- gtp defaults
---------------------------------------------------------------------------

gtp_v0_msg =
{
    { type = 1, name = "echo_request" },
    { type = 2, name = "echo_response" },
    { type = 3, name = "version_not_supported" },
    { type = 4, name = "node_alive_request" },
    { type = 5, name = "node_alive_response" },
    { type = 6, name = "redirection_request" },
    { type = 7, name = "redirection_response" },

    { type = 16, name = "create_pdp_context_request" },
    { type = 17, name = "create_pdp_context_response" },
    { type = 18, name = "update_pdp_context_request" },
    { type = 19, name = "update_pdp_context_response" },
    { type = 20, name = "delete_pdp_context_request" },
    { type = 21, name = "delete_pdp_context_response" },
    { type = 22, name = "create_aa_pdp_context_request" },
    { type = 23, name = "create_aa_pdp_context_response" },
    { type = 24, name = "delete_aa_pdp_context_request" },
    { type = 25, name = "delete_aa_pdp_context_response" },
    { type = 26, name = "error_indication" },
    { type = 27, name = "pdu_notification_request" },
    { type = 28, name = "pdu_notification_response" },
    { type = 29, name = "pdu_notification_reject_request" },
    { type = 30, name = "pdu_notification_reject_response" },

    { type = 32, name = "send_routing_info_request" },
    { type = 33, name = "send_routing_info_response" },
    { type = 34, name = "failure_report_request" },
    { type = 35, name = "failure_report_response" },
    { type = 36, name = "note_ms_present_request" },
    { type = 37, name = "note_ms_present_response" },

    { type = 48, name = "identification_request" },
    { type = 49, name = "identification_response" },
    { type = 50, name = "sgsn_context_request" },
    { type = 51, name = "sgsn_context_response" },
    { type = 52, name = "sgsn_context_ack" },

    { type = 240, name = "data_record_transfer_request" },
    { type = 241, name = "data_record_transfer_response" },

    { type = 255, name = "pdu" },
}

gtp_v1_msg =
{
    { type = 1, name = "echo_request" },
    { type = 2, name = "echo_response" },
    { type = 3, name = "version_not_supported" },
    { type = 4, name = "node_alive_request" },
    { type = 5, name = "node_alive_response" },
    { type = 6, name = "redirection_request" },
    { type = 7, name = "redirection_response" },

    { type = 16, name = "create_pdp_context_request" },
    { type = 17, name = "create_pdp_context_response" },
    { type = 18, name = "update_pdp_context_request" },
    { type = 19, name = "update_pdp_context_response" },
    { type = 20, name = "delete_pdp_context_request" },
    { type = 21, name = "delete_pdp_context_response" },
    { type = 22, name = "init_pdp_context_activation_request" },
    { type = 23, name = "init_pdp_context_activation_response" },

    { type = 26, name = "error_indication" },
    { type = 27, name = "pdu_notification_request" },
    { type = 28, name = "pdu_notification_response" },
    { type = 29, name = "pdu_notification_reject_request" },
    { type = 30, name = "pdu_notification_reject_response" },
    { type = 31, name = "supported_ext_header_notification" },
    { type = 32, name = "send_routing_info_request" },
    { type = 33, name = "send_routing_info_response" },
    { type = 34, name = "failure_report_request" },
    { type = 35, name = "failure_report_response" },
    { type = 36, name = "note_ms_present_request" },
    { type = 37, name = "note_ms_present_response" },

    { type = 48, name = "identification_request" },
    { type = 49, name = "identification_response" },
    { type = 50, name = "sgsn_context_request" },
    { type = 51, name = "sgsn_context_response" },
    { type = 52, name = "sgsn_context_ack" },
    { type = 53, name = "forward_relocation_request" },
    { type = 54, name = "forward_relocation_response" },
    { type = 55, name = "forward_relocation_complete" },
    { type = 56, name = "relocation_cancel_request" },
    { type = 57, name = "relocation_cancel_response" },
    { type = 58, name = "forward_srns_contex" },
    { type = 59, name = "forward_relocation_complete_ack" },
    { type = 60, name = "forward_srns_contex_ack" },

    { type = 70, name = "ran_info_relay" },

    { type = 96, name = "mbms_notification_request" },
    { type = 97, name = "mbms_notification_response" },
    { type = 98, name = "mbms_notification_reject_request" },
    { type = 99, name = "mbms_notification_reject_response" },
    { type = 100, name = "create_mbms_context_request" },
    { type = 101, name = "create_mbms_context_response" },
    { type = 102, name = "update_mbms_context_request" },
    { type = 103, name = "update_mbms_context_response" },
    { type = 104, name = "delete_mbms_context_request" },
    { type = 105, name = "delete_mbms_context_response" },

    { type = 112, name = "mbms_register_request" },
    { type = 113, name = "mbms_register_response" },
    { type = 114, name = "mbms_deregister_request" },
    { type = 115, name = "mbms_deregister_response" },
    { type = 116, name = "mbms_session_start_request" },
    { type = 117, name = "mbms_session_start_response" },
    { type = 118, name = "mbms_session_stop_request" },
    { type = 119, name = "mbms_session_stop_response" },
    { type = 120, name = "mbms_session_update_request" },
    { type = 121, name = "mbms_session_update_response" },

    { type = 128, name = "ms_info_change_request" },
    { type = 129, name = "ms_info_change_response" },

    { type = 240, name = "data_record_transfer_request" },
    { type = 241, name = "data_record_transfer_response" },

    { type = 254, name = "end_marker" },
    { type = 255, name = "pdu" },
}

gtp_v2_msg =
{
    { type = 1, name = "echo_request" },
    { type = 2, name = "echo_response" },
    { type = 3, name = "version_not_supported" },

    { type = 32, name = "create_session_request" },
    { type = 33, name = "create_session_response" },
    { type = 34, name = "modify_bearer_request" },
    { type = 35, name = "modify_bearer_response" },
    { type = 36, name = "delete_session_request" },
    { type = 37, name = "delete_session_response" },
    { type = 38, name = "change_notification_request" },
    { type = 39, name = "change_notification_response" },

    { type = 64, name = "modify_bearer_command" },
    { type = 65, name = "modify_bearer_failure_indication" },
    { type = 66, name = "delete_bearer_command" },
    { type = 67, name = "delete_bearer_failure_indication" },
    { type = 68, name = "bearer_resource_command" },
    { type = 69, name = "bearer_resource_failure_indication" },
    { type = 70, name = "downlink_failure_indication" },
    { type = 71, name = "trace_session_activation" },
    { type = 72, name = "trace_session_deactivation" },
    { type = 73, name = "stop_paging_indication" },

    { type = 95, name = "create_bearer_request" },
    { type = 96, name = "create_bearer_response" },
    { type = 97, name = "update_bearer_request" },
    { type = 98, name = "update_bearer_response" },
    { type = 99, name = "delete_bearer_request" },
    { type = 100, name = "delete_bearer_response" },
    { type = 101, name = "delete_pdn_request" },
    { type = 102, name = "delete_pdn_response" },

    { type = 128, name = "identification_request" },
    { type = 129, name = "identification_response" },
    { type = 130, name = "sgsn_context_request" },
    { type = 131, name = "sgsn_context_response" },
    { type = 132, name = "sgsn_context_ack" },
    { type = 133, name = "forward_relocation_request" },
    { type = 134, name = "forward_relocation_response" },
    { type = 135, name = "forward_relocation_complete" },
    { type = 136, name = "forward_relocation_complete_ack" },
    { type = 137, name = "forward_access" },
    { type = 138, name = "forward_access_ack" },
    { type = 139, name = "relocation_cancel_request" },
    { type = 140, name = "relocation_cancel_response" },
    { type = 141, name = "configuration_transfer_tunnel" },

    { type = 149, name = "detach" },
    { type = 150, name = "detach_ack" },
    { type = 151, name = "cs_paging" },
    { type = 152, name = "ran_info_relay" },
    { type = 153, name = "alert_mme" },
    { type = 154, name = "alert_mme_ack" },
    { type = 155, name = "ue_activity" },
    { type = 156, name = "ue_activity_ack" },

    { type = 160, name = "create_forward_tunnel_request" },
    { type = 161, name = "create_forward_tunnel_response" },
    { type = 162, name = "suspend" },
    { type = 163, name = "suspend_ack" },
    { type = 164, name = "resume" },
    { type = 165, name = "resume_ack" },
    { type = 166, name = "create_indirect_forward_tunnel_request" },
    { type = 167, name = "create_indirect_forward_tunnel_response" },
    { type = 168, name = "delete_indirect_forward_tunnel_request" },
    { type = 169, name = "delete_indirect_forward_tunnel_response" },
    { type = 170, name = "release_access_bearer_request" },
    { type = 171, name = "release_access_bearer_response" },

    { type = 176, name = "downlink_data" },
    { type = 177, name = "downlink_data_ack" },

    { type = 179, name = "pgw_restart" },
    { type = 180, name = "pgw_restart_ack" },

    { type = 200, name = "update_pdn_request" },
    { type = 201, name = "update_pdn_response" },

    { type = 211, name = "modify_access_bearer_request" },
    { type = 212, name = "modify_access_bearer_response" },

    { type = 231, name = "mbms_session_start_request" },
    { type = 232, name = "mbms_session_start_response" },
    { type = 233, name = "mbms_session_update_request" },
    { type = 234, name = "mbms_session_update_response" },
    { type = 235, name = "mbms_session_stop_request" },
    { type = 236, name = "mbms_session_stop_response" },
};

-- length = 0 indicates variable length

gtp_v0_info =
{
    { type = 1, name = "cause", length = 2 },
    { type = 2, name = "imsi", length = 9 },
    { type = 3, name = "rai", length = 7 },
    { type = 4, name = "tlli", length = 5 },
    { type = 5, name = "p_tmsi", length = 5 },
    { type = 6, name = "qos", length = 4 },

    { type = 8, name = "recording_required", length = 2 },
    { type = 9, name = "authentication", length = 29 },

    { type = 11, name = "map_cause", length = 2 },
    { type = 12, name = "p_tmsi_sig", length = 4 },
    { type = 13, name = "ms_validated", length = 2 },
    { type = 14, name = "recovery", length = 2 },
    { type = 15, name = "selection_mode", length = 2 },
    { type = 16, name = "flow_label_data_1", length = 3 },
    { type = 17, name = "flow_label_signalling", length = 3 },
    { type = 18, name = "flow_label_data_2", length = 4 },
    { type = 19, name = "ms_unreachable", length = 2 },

    { type = 127, name = "charge_id", length = 5 },
    { type = 128, name = "end_user_address", length = 0 },
    { type = 129, name = "mm_context", length = 0 },
    { type = 130, name = "pdp_context", length = 0 },
    { type = 131, name = "apn", length = 0 },
    { type = 132, name = "protocol_config", length = 0 },
    { type = 133, name = "gsn", length = 0 },
    { type = 134, name = "msisdn", length = 0 },

    { type = 251, name = "charging_gateway_addr", length = 0 },

    { type = 255, name = "private_extension", length = 0 },
}

gtp_v1_info =
{
    { type = 1, name = "cause", length = 2 },
    { type = 2, name = "imsi", length = 9 },
    { type = 3, name = "rai", length = 7 },
    { type = 4, name = "tlli", length = 5 },
    { type = 5, name = "p_tmsi", length = 5 },

    { type = 8, name = "recording_required", length = 2 },
    { type = 9, name = "authentication", length = 29 },

    { type = 11, name = "map_cause", length = 2 },
    { type = 12, name = "p_tmsi_sig", length = 4 },
    { type = 13, name = "ms_validated", length = 2 },
    { type = 14, name = "recovery", length = 2 },
    { type = 15, name = "selection_mode", length = 2 },
    { type = 16, name = "teid_1", length = 5 },
    { type = 17, name = "teid_control", length = 5 },
    { type = 18, name = "teid_2", length = 6 },
    { type = 19, name = "teardown_ind", length = 2 },
    { type = 20, name = "nsapi", length = 2 },
    { type = 21, name = "ranap", length = 2 },
    { type = 22, name = "rab_context", length = 10 },
    { type = 23, name = "radio_priority_sms", length = 2 },
    { type = 24, name = "radio_priority", length = 2 },
    { type = 25, name = "packet_flow_id", length = 3 },
    { type = 26, name = "charging_char", length = 3 },
    { type = 27, name = "trace_ref", length = 3 },
    { type = 28, name = "trace_type", length = 3 },
    { type = 29, name = "ms_unreachable", length = 2 },

    {  type =127, name = "charge_id", length = 5 },
    { type = 128, name = "end_user_address", length = 0 },
    { type = 129, name = "mm_context", length = 0 },
    { type = 130, name = "pdp_context", length = 0 },
    { type = 131, name = "apn", length = 0 },
    { type = 132, name = "protocol_config", length = 0 },
    { type = 133, name = "gsn", length = 0 },
    { type = 134, name = "msisdn", length = 0 },
    { type = 135, name = "qos", length = 0 },
    { type = 136, name = "authentication_qu", length = 0 },
    { type = 137, name = "tft", length = 0 },
    { type = 138, name = "target_id", length = 0 },
    { type = 139, name = "utran_trans", length = 0 },
    { type = 140, name = "rab_setup", length = 0 },
    { type = 141, name = "ext_header", length = 0 },
    { type = 142, name = "trigger_id", length = 0 },
    { type = 143, name = "omc_id", length = 0 },
    { type = 144, name = "ran_trans", length = 0 },
    { type = 145, name = "pdp_context_pri", length = 0 },
    { type = 146, name = "addi_rab_setup", length = 0 },
    { type = 147, name = "sgsn_number", length = 0 },
    { type = 148, name = "common_flag", length = 0 },
    { type = 149, name = "apn_restriction", length = 0 },
    { type = 150, name = "radio_priority_lcs", length = 4 },
    { type = 151, name = "rat_type", length = 0 },
    { type = 152, name = "user_loc_info", length = 0 },
    { type = 153, name = "ms_time_zone", length = 0 },
    { type = 154, name = "imei_sv", length = 0 },
    { type = 155, name = "camel", length = 0 },
    { type = 156, name = "mbms_ue_context", length = 0 },
    { type = 157, name = "tmp_mobile_group_id", length = 0 },
    { type = 158, name = "rim_routing_addr", length = 0 },
    { type = 159, name = "mbms_config", length = 0 },
    { type = 160, name = "mbms_service_area", length = 0 },
    { type = 161, name = "src_rnc_pdcp", length = 0 },
    { type = 162, name = "addi_trace_info", length = 0 },
    { type = 163, name = "hop_counter", length = 0 },
    { type = 164, name = "plmn_id", length = 0 },
    { type = 165, name = "mbms_session_id", length = 0 },
    { type = 166, name = "mbms_2g3g_indicator", length = 0 },
    { type = 167, name = "enhanced_nsapi", length = 0 },
    { type = 168, name = "mbms_session_duration", length = 0 },
    { type = 169, name = "addi_mbms_trace_info", length = 0 },
    { type = 170, name = "mbms_session_repetition_num", length = 0 },
    { type = 171, name = "mbms_time_to_data", length = 0 },

    { type = 173, name = "bss", length = 0 },
    { type = 174, name = "cell_id", length = 0 },
    { type = 175, name = "pdu_num", length = 0 },
    { type = 177, name = "mbms_bearer_capab", length = 0 },
    { type = 178, name = "rim_routing_disc", length = 0 },
    { type = 179, name = "list_pfc", length = 0 },
    { type = 180, name = "ps_xid", length = 0 },
    { type = 181, name = "ms_info_change_report", length = 4 },
    { type = 182, name = "direct_tunnel_flags", length = 0 },
    { type = 183, name = "correlation_id", length = 0 },
    { type = 184, name = "bearer_control_mode", length = 0 },
    { type = 185, name = "mbms_flow_id", length = 0 },
    { type = 186, name = "mbms_ip_multicast", length = 0 },
    { type = 187, name = "mbms_distribution_ack", length = 4 },
    { type = 188, name = "reliable_inter_rat_handover", length = 0 },
    { type = 189, name = "rfsp_index", length = 0 },
    { type = 190, name = "fqdn", length = 0 },
    { type = 191, name = "evolved_allocation1", length = 0 },
    { type = 192, name = "evolved_allocation2", length = 0 },
    { type = 193, name = "extended_flags", length = 0 },
    { type = 194, name = "uci", length = 0 },
    { type = 195, name = "csg_info", length = 0 },
    { type = 196, name = "csg_id", length = 0 },
    { type = 197, name = "cmi", length = 4 },
    { type = 198, name = "apn_ambr", length = 0 },
    { type = 199, name = "ue_network", length = 0 },
    { type = 200, name = "ue_ambr", length = 0 },
    { type = 201, name = "apn_ambr_nsapi", length = 0 },
    { type = 202, name = "ggsn_backoff_timer", length = 0 },
    { type = 203, name = "signalling_priority_indication", length = 0 },
    { type = 204, name = "signalling_priority_indication_nsapi", length = 0 },
    { type = 205, name = "high_bitrate", length = 4 },
    { type = 206, name = "max_mbr", length = 0 },

    { type = 251, name = "charging_gateway_addr", length = 0 },

    { type = 255, name = "private_extension", length = 0 },
}

gtp_v2_info =
{
    { type = 1, name = "imsi", length = 0 },
    { type = 2, name = "cause", length = 0 },
    { type = 3, name = "recovery", length = 0 },

    { type = 71, name = "apn", length = 0 },
    { type = 72, name = "ambr", length = 0 },
    { type = 73, name = "ebi", length = 0 },
    { type = 74, name = "ip_addr", length = 0 },
    { type = 75, name = "mei", length = 0 },
    { type = 76, name = "msisdn", length = 0 },
    { type = 77, name = "indication", length = 0 },
    { type = 78, name = "pco", length = 0 },
    { type = 79, name = "paa", length = 0 },
    { type = 80, name = "bearer_qos", length = 0 },
    { type = 81, name = "flow_qos", length = 0 },
    { type = 82, name = "rat_type", length = 0 },
    { type = 83, name = "serving_network", length = 0 },
    { type = 84, name = "bearer_tft", length = 0 },
    { type = 85, name = "tad", length = 0 },
    { type = 86, name = "uli", length = 0 },
    { type = 87, name = "f_teid", length = 0 },
    { type = 88, name = "tmsi", length = 0 },
    { type = 89, name = "cn_id", length = 0 },
    { type = 90, name = "s103pdf", length = 0 },
    { type = 91, name = "s1udf", length = 0 },
    { type = 92, name = "delay_value", length = 0 },
    { type = 93, name = "bearer_context", length = 0 },
    { type = 94, name = "charging_id", length = 0 },
    { type = 95, name = "charging_char", length = 0 },
    { type = 96, name = "trace_info", length = 0 },
    { type = 97, name = "bearer_flag", length = 0 },

    { type = 99,  name = "pdn_type", length = 0 },
    { type = 100, name = "pti", length = 0 },
    { type = 101, name = "drx_parameter", length = 0 },

    { type = 103, name = "gsm_key_tri", length = 0 },
    { type = 104, name = "umts_key_cipher_quin", length = 0 },
    { type = 105, name = "gsm_key_cipher_quin", length = 0 },
    { type = 106, name = "umts_key_quin", length = 0 },
    { type = 107, name = "eps_quad", length = 0 },
    { type = 108, name = "umts_key_quad_quin", length = 0 },
    { type = 109, name = "pdn_connection", length = 0 },
    { type = 110, name = "pdn_number", length = 0 },
    { type = 111, name = "p_tmsi", length = 0 },
    { type = 112, name = "p_tmsi_sig", length = 0 },
    { type = 113, name = "hop_counter", length = 0 },
    { type = 114, name = "ue_time_zone", length = 0 },
    { type = 115, name = "trace_ref", length = 0 },
    { type = 116, name = "complete_request_msg", length = 0 },
    { type = 117, name = "guti", length = 0 },
    { type = 118, name = "f_container", length = 0 },
    { type = 119, name = "f_cause", length = 0 },
    { type = 120, name = "plmn_id", length = 0 },
    { type = 121, name = "target_id", length = 0 },

    { type = 123, name = "packet_flow_id", length = 0 },
    { type = 124, name = "rab_contex", length = 0 },
    { type = 125, name = "src_rnc_pdcp", length = 0 },
    { type = 126, name = "udp_src_port", length = 0 },
    { type = 127, name = "apn_restriction", length = 0 },
    { type = 128, name = "selection_mode", length = 0 },
    { type = 129, name = "src_id", length = 0 },

    { type = 131, name = "change_report_action", length = 0 },
    { type = 132, name = "fq_csid", length = 0 },
    { type = 133, name = "channel", length = 0 },
    { type = 134, name = "emlpp_pri", length = 0 },
    { type = 135, name = "node_type", length = 0 },
    { type = 136, name = "fqdn", length = 0 },
    { type = 137, name = "ti", length = 0 },
    { type = 138, name = "mbms_session_duration", length = 0 },
    { type = 139, name = "mbms_service_area", length = 0 },
    { type = 140, name = "mbms_session_id", length = 0 },
    { type = 141, name = "mbms_flow_id", length = 0 },
    { type = 142, name = "mbms_ip_multicast", length = 0 },
    { type = 143, name = "mbms_distribution_ack", length = 0 },
    { type = 144, name = "rfsp_index", length = 0 },
    { type = 145, name = "uci", length = 0 },
    { type = 146, name = "csg_info", length = 0 },
    { type = 147, name = "csg_id", length = 0 },
    { type = 148, name = "cmi", length = 0 },
    { type = 149, name = "service_indicator", length = 0 },
    { type = 150, name = "detach_type", length = 0 },
    { type = 151, name = "ldn", length = 0 },
    { type = 152, name = "node_feature", length = 0 },
    { type = 153, name = "mbms_time_to_transfer", length = 0 },
    { type = 154, name = "throttling", length = 0 },
    { type = 155, name = "arp", length = 0 },
    { type = 156, name = "epc_timer", length = 0 },
    { type = 157, name = "signalling_priority_indication", length = 0 },
    { type = 158, name = "tmgi", length = 0 },
    { type = 159, name = "mm_srvcc", length = 0 },
    { type = 160, name = "flags_srvcc", length = 0 },
    { type = 161, name = "mmbr", length = 0 },

    { type = 255, name = "private_extension", length = 0 },
}

default_gtp =
{
    { version = 0, messages = gtp_v0_msg, infos = gtp_v0_info },
    { version = 1, messages = gtp_v1_msg, infos = gtp_v1_info },
    { version = 2, messages = gtp_v2_msg, infos = gtp_v2_info },
}

