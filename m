Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF88BE00997; Wed, 30 Apr 2014 13:00:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CC41E00985
	for <meta-ti@yoctoproject.org>; Wed, 30 Apr 2014 13:00:57 -0700 (PDT)
Received: from smtp.raymondcorp.com (localhost [127.0.0.1])
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id s3UK0noe003631
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Wed, 30 Apr 2014 15:00:57 -0500
Received: from localhost (localhost [[UNIX: localhost]])
	by smtp.raymondcorp.com (8.14.3/8.14.3/Submit) with SMTP id
	s3UK0R9L003337
	for <meta-ti@yoctoproject.org>; Wed, 30 Apr 2014 15:00:27 -0500
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.252]) by usnygrcas2
	([130.1.155.199]) with mapi id 14.03.0174.001; Wed, 30 Apr 2014 16:00:21
	-0400
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>, "Murphy, Dan" <dmurphy@ti.com>
Thread-Topic: Kernel Hang I2C1??
Thread-Index: Ac9kjbK9NF7l2hAPTFGOrV7u1lzpFAAHjaAAAACCXLA=
Date: Wed, 30 Apr 2014 20:00:20 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622BA96F34@USNYGRMBX4.raymondcorp.local>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA96E10@USNYGRMBX4.raymondcorp.local>,
	<7D46E86EC0A8354091174257B2FED1015CFC6122@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CFC6122@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.150.131]
MIME-Version: 1.0
X-mailWatchMessageID: 1398888027.451736.1642.4275814408
X-mailWatchContentScore: Score of 0 assigned to Content
X-mailWatchUCEScore: Score of 0 assigned to UCE
X-mailWatch: Analyzed by IntelliReach MessageScreen(tm)
Subject: Re: Kernel Hang I2C1??
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Apr 2014 20:00:59 -0000
X-Groupsio-MsgNum: 4369
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_003_7D1F292BE8E4CC4F93079C1A7A58D5622BA96F34USNYGRMBX4raymo_"

--_003_7D1F292BE8E4CC4F93079C1A7A58D5622BA96F34USNYGRMBX4raymo_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Chase,

I followed the entry in am335x-evm to add i2c1 rather than i2c0 in the be=
agle bone black dts.

FYI what ever we find i will add to the post at http://e2e.ti.com/support=
/arm/sitara_arm/f/791/p/335136/1179969.aspx#1179969

Thanks
-josh
________________________________________
From: Maupin, Chase [chase.maupin@ti.com]
Sent: Wednesday, April 30, 2014 3:40 PM
To: Vanderpool Josh; meta-ti@yoctoproject.org; Murphy, Dan
Subject: RE: Kernel Hang I2C1??

Josh,

Do you have the I2C2 entry in your DT?  There are examples in the am33xx.=
dtsi file.

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://e2e.ti.com<http://e2e.ti.com/>
Wiki - http://processors.wiki.ti.com/index.php/Main_Page

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproje=
ct.org] On Behalf Of Vanderpool Josh
Sent: Wednesday, April 30, 2014 9:03 AM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] Kernel Hang I2C1??

I have a custom board and expect to use i2c1 on the board but it appears =
to not allow this in the kernel=85
u-boot was able to be modified to support the hardware port i2c1.  Note t=
hat that software is 1based and hardware is zero-based=85

This is the dump:
=B7        [    1.482628] ------------[ cut here ]------------
=B7        [    1.487549] WARNING: CPU: 0 PID: 1 at arch/arm/mach-omap2/o=
map_device.c:888 omap_device_get_by_hwmod_name+0x94/0xb4()
=B7        [    1.498803] omap_device_get_by_hwmod_name: no omap_device f=
or i2c1
=B7        [    1.505365] Modules linked in:
=B7        [    1.508606] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.10=
-ti2013.12.01 #2
=B7        [    1.515990] Backtrace:
=B7        [    1.518595] [<c0017880>] (dump_backtrace+0x0/0x10c) from [<=
c0017a1c>] (show_stack+0x18/0x1c)
=B7        [    1.527542]  r6:c002f564 r5:00000009 r4:dd083e28 r3:0000000=
0
=B7        [    1.533567] [<c0017a04>] (show_stack+0x0/0x1c) from [<c0580=
ba4>] (dump_stack+0x20/0x28)
=B7        [    1.542068] [<c0580b84>] (dump_stack+0x0/0x28) from [<c0046=
d08>] (warn_slowpath_common+0x70/0x90)
=B7        [    1.551480] [<c0046c98>] (warn_slowpath_common+0x0/0x90) fr=
om [<c0046dcc>] (warn_slowpath_fmt+0x38/0x40)
=B7        [    1.561528]  r8:c076b3fc r7:c0768410 r6:c0c8c9ac r5:c084df0=
8 r4:c06b9fa4
=B7        [    1.568647] [<c0046d94>] (warn_slowpath_fmt+0x0/0x40) from =
[<c002f564>] (omap_device_get_by_hwmod_name+0x94/0xb4)
=B7        [    1.579523]  r3:c058be8c r2:c06b6584
=B7        [    1.583341] [<c002f4d0>] (omap_device_get_by_hwmod_name+0x0=
/0xb4) from [<c0778280>] (am33xx_pm_init+0x204/0x45c)
=B7        [    1.594120]  r4:00000000
=B7        [    1.596808] [<c077807c>] (am33xx_pm_init+


The full capture is http://pastebin.com/VyY8CQ0L

I found where roughly where there might be an issue=85pm33xx.c as line#39=
5 states it can only use bus i2c1(one based(I assume this is i2c0))
Note I do not need smart reflex or sleep mode at all so any patches to wo=
rk around this are welcome.

Thanks

Josh Vanderpool
Electrical Engineer


Confidentiality Notice: The preceding e-mail message (including any attac=
hments) contains information that may be confidential, protected by appli=
cable legal privileges, or constitute non-public information. It is inten=
ded to be conveyed only to the designated recipient(s). If you are not an=
 intended recipient of this message, please notify the sender by replying=
 to this message and then delete it from your system. Use, dissemination,=
 distribution or reproduction of this message by unintended recipients is=
 not authorized and may be unlawful.

Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.



--_003_7D1F292BE8E4CC4F93079C1A7A58D5622BA96F34USNYGRMBX4raymo_
Content-Type: text/plain; name="am335x-bonenblue-common.dtsi.txt"
Content-Description: am335x-bonenblue-common.dtsi.txt
Content-Disposition: attachment;
	filename="am335x-bonenblue-common.dtsi.txt"; size=4367;
	creation-date="Wed, 30 Apr 2014 19:55:16 GMT";
	modification-date="Wed, 30 Apr 2014 19:55:16 GMT"
Content-Transfer-Encoding: base64

LyoKICogQ29weXJpZ2h0IChDKSAyMDEyIFRleGFzIEluc3RydW1lbnRzIEluY29ycG9yYXRlZCAt
IGh0dHA6Ly93d3cudGkuY29tLwogKgogKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsg
eW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogKiBpdCB1bmRlciB0aGUgdGVy
bXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcwogKiBwdWJs
aXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4KICovCgovIHsKCW1vZGVsID0g
IlRJIEFNMzM1eCBCZWFnbGVCb25lIjsKCWNvbXBhdGlibGUgPSAidGksYW0zMzV4LWJvbmUiLCAi
dGksYW0zM3h4IjsKCgljcHVzIHsKCQljcHVAMCB7CgkJCWNwdTAtc3VwcGx5ID0gPCZkY2RjMl9y
ZWc+OwoJCX07Cgl9OwoKCW1lbW9yeSB7CgkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKCQlyZWcg
PSA8MHg4MDAwMDAwMCAweDIwMDAwMDAwPjsgLyogNTEyIE1CIGpkdioqICovCgl9OwoKCWFtMzN4
eF9waW5tdXg6IHBpbm11eEA0NGUxMDgwMCB7CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsK
CgoKICAgICAgaTJjMV9waW5zOiBwaW5tdXhfaTJjMV9waW5zIHsKCQkJcGluY3RybC1zaW5nbGUs
cGlucyA9IDwKCQkJCTB4MTgwIChQSU5fSU5QVVRfUFVMTFVQIHwgTVVYX01PREUzKQkvKiB1YXJ0
MV9yeC5pMmMxX3NkYSAqLwoJCQkJMHgxODQgKFBJTl9JTlBVVF9QVUxMVVAgfCBNVVhfTU9ERTMp
CS8qIHVhcnQxX3R4LmkyYzFfc2NsICovCgkJCT47CgkJfTsKCgkJdWFydDBfcGluczogcGlubXV4
X3VhcnQwX3BpbnMgewoJCQlwaW5jdHJsLXNpbmdsZSxwaW5zID0gPAoJCQkJMHgxNzAgKFBJTl9J
TlBVVF9QVUxMVVAgfCBNVVhfTU9ERTApCS8qIHVhcnQwX3J4ZC51YXJ0MF9yeGQgKi8KCQkJCTB4
MTc0IChQSU5fT1VUUFVUX1BVTExET1dOIHwgTVVYX01PREUwKQkvKiB1YXJ0MF90eGQudWFydDBf
dHhkICovCgkJCT47CgkJfTsKCgoKCgkJZW1tY19waW5zOiBwaW5tdXhfZW1tY19waW5zIHsKCQkJ
cGluY3RybC1zaW5nbGUscGlucyA9IDwKCQkJCTB4ODAgKFBJTl9JTlBVVF9QVUxMVVAgfCBNVVhf
TU9ERTIpIC8qIGdwbWNfY3NuMS5tbWMxX2NsayAqLwoJCQkJMHg4NCAoUElOX0lOUFVUX1BVTExV
UCB8IE1VWF9NT0RFMikgLyogZ3BtY19jc24yLm1tYzFfY21kICovCgkJCQkweDAwIChQSU5fSU5Q
VVRfUFVMTFVQIHwgTVVYX01PREUxKSAvKiBncG1jX2FkMC5tbWMxX2RhdDAgKi8KCQkJCTB4MDQg
KFBJTl9JTlBVVF9QVUxMVVAgfCBNVVhfTU9ERTEpIC8qIGdwbWNfYWQxLm1tYzFfZGF0MSAqLwoJ
CQkJMHgwOCAoUElOX0lOUFVUX1BVTExVUCB8IE1VWF9NT0RFMSkgLyogZ3BtY19hZDIubW1jMV9k
YXQyICovCgkJCQkweDBjIChQSU5fSU5QVVRfUFVMTFVQIHwgTVVYX01PREUxKSAvKiBncG1jX2Fk
My5tbWMxX2RhdDMgKi8KCQkJCTB4MTAgKFBJTl9JTlBVVF9QVUxMVVAgfCBNVVhfTU9ERTEpIC8q
IGdwbWNfYWQ0Lm1tYzFfZGF0NCAqLwoJCQkJMHgxNCAoUElOX0lOUFVUX1BVTExVUCB8IE1VWF9N
T0RFMSkgLyogZ3BtY19hZDUubW1jMV9kYXQ1ICovCgkJCQkweDE4IChQSU5fSU5QVVRfUFVMTFVQ
IHwgTVVYX01PREUxKSAvKiBncG1jX2FkNi5tbWMxX2RhdDYgKi8KCQkJCTB4MWMgKFBJTl9JTlBV
VF9QVUxMVVAgfCBNVVhfTU9ERTEpIC8qIGdwbWNfYWQ3Lm1tYzFfZGF0NyAqLwoJCQk+OwoJCX07
Cgl9OwoKCW9jcCB7CgkJdWFydDA6IHNlcmlhbEA0NGUwOTAwMCB7CgkJCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7CgkJCXBpbmN0cmwtMCA9IDwmdWFydDBfcGlucz47CgoJCQlzdGF0dXMgPSAi
b2theSI7CgkJfTsKCgkJbXVzYjogdXNiQDQ3NDAwMDAwIHsKCQkJc3RhdHVzID0gIm9rYXkiOwoK
CQkJY29udHJvbEA0NGUxMDAwMCB7CgkJCQlzdGF0dXMgPSAib2theSI7CgkJCX07CgoJCQl1c2It
cGh5QDQ3NDAxMzAwIHsKCQkJCXN0YXR1cyA9ICJva2F5IjsKCQkJfTsKCgkJCXVzYi1waHlANDc0
MDFiMDAgewoJCQkJc3RhdHVzID0gIm9rYXkiOwoJCQl9OwoKCQkJdXNiQDQ3NDAxMDAwIHsKCQkJ
CXN0YXR1cyA9ICJva2F5IjsKCQkJfTsKCgkJCXVzYkA0NzQwMTgwMCB7CgkJCQlzdGF0dXMgPSAi
b2theSI7CgkJCQlkcl9tb2RlID0gImhvc3QiOwoJCQl9OwoKCQkJZG1hLWNvbnRyb2xsZXJAMDc0
MDIwMDAgIHsKCQkJCXN0YXR1cyA9ICJva2F5IjsKCQkJfTsKCQl9OwoKCQlpMmMxOiBpMmNANDgw
MmEwMDAgewoJCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJCQlwaW5jdHJsLTAgPSA8Jmky
YzFfcGlucz47CgkJCXN0YXR1cyA9ICJva2F5IjsKCQkJY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAw
MD47CgoJCQkvKiBTZXQgT1BQNTAgKDAuOTVWKSBmb3IgVkREIGNvcmUgKi8KCQkJc2xlZXAtc2Vx
dWVuY2UgPSAvYml0cy8gOCA8CgkJCQkweDAyIDB4MjQgMHgwYiAweDZkIC8qIFBhc3N3b3JkIHVu
bG9jayAxICovCgkJCQkweDAyIDB4MjQgMHgxMCAweDAyIC8qIFNldCBEQ0RDMyB0byAwLjk1ViAq
LwoJCQkJMHgwMiAweDI0IDB4MGIgMHg2ZCAvKiBQYXNzd29yZCB1bmxvY2sgMiAqLwoJCQkJMHgw
MiAweDI0IDB4MTAgMHgwMiAvKiBTZXQgRENEQzMgdG8gMC45NVYgKi8KCQkJCTB4MDIgMHgyNCAw
eDBiIDB4NmMgLyogUGFzc3dvcmQgdW5sb2NrIDEgKi8KCQkJCTB4MDIgMHgyNCAweDExIDB4ODYg
LyogQXBwbHkgRENEQyBjaGFuZ2VzICovCgkJCQkweDAyIDB4MjQgMHgwYiAweDZjIC8qIFBhc3N3
b3JkIHVubG9jayAyICovCgkJCQkweDAyIDB4MjQgMHgxMSAweDg2IC8qIEFwcGx5IERDREMgY2hh
bmdlcyAqLwoJCQk+OwoKCQkJLyogU2V0IE9QUDEwMCAoMS4xMFYpIGZvciBWREQgY29yZSAqLwoJ
CQl3YWtlLXNlcXVlbmNlID0gL2JpdHMvIDggPAoJCQkJMHgwMiAweDI0IDB4MGIgMHg2ZCAvKiBQ
YXNzd29yZCB1bmxvY2sgMSAqLwoJCQkJMHgwMiAweDI0IDB4MTAgMHgwOCAvKiBTZXQgRENEQzMg
dG8gMS4xViAqLwoJCQkJMHgwMiAweDI0IDB4MGIgMHg2ZCAvKiBQYXNzd29yZCB1bmxvY2sgMiAq
LwoJCQkJMHgwMiAweDI0IDB4MTAgMHgwOCAvKiBTZXQgRENEQzMgdG8gMS4xViAqLwoJCQkJMHgw
MiAweDI0IDB4MGIgMHg2YyAvKiBQYXNzd29yZCB1bmxvY2sgMSAqLwoJCQkJMHgwMiAweDI0IDB4
MTEgMHg4NiAvKiBBcHBseSBEQ0RDIGNoYW5nZXMgKi8KCQkJCTB4MDIgMHgyNCAweDBiIDB4NmMg
LyogUGFzc3dvcmQgdW5sb2NrIDIgKi8KCQkJCTB4MDIgMHgyNCAweDExIDB4ODYgLyogQXBwbHkg
RENEQyBjaGFuZ2VzICovCgkJCT47CgoJCQl0cHM6IHRwc0AyNCB7CgkJCQlyZWcgPSA8MHgyND47
CgkJCX07CgoJCX07Cgl9OwoJdm1tY3NkX2ZpeGVkOiBmaXhlZHJlZ3VsYXRvckAwIHsKCQljb21w
YXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7CgkJcmVndWxhdG9yLW5hbWUgPSAidm1tY3NkX2Zp
eGVkIjsKCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKCQlyZWd1bGF0b3It
bWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKCX07Cn07CgojaW5jbHVkZSAidHBzNjUyMTcuZHRz
aSIKCiZ0cHMgewoJcmVndWxhdG9ycyB7CgkJZGNkYzFfcmVnOiByZWd1bGF0b3JAMCB7CgkJCXJl
Z3VsYXRvci1hbHdheXMtb247CgkJfTsKCgkJZGNkYzJfcmVnOiByZWd1bGF0b3JAMSB7CgkJCS8q
IFZERF9NUFUgdm9sdGFnZSBsaW1pdHMgMC45NVYgLSAxLjMyNVYgd2l0aCArLy00JSB0b2xlcmFu
Y2UgKi8KCQkJcmVndWxhdG9yLW5hbWUgPSAidmRkX21wdSI7CgkJCXJlZ3VsYXRvci1taW4tbWlj
cm92b2x0ID0gPDkyNTAwMD47CgkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDEzNzgwMDA+
OwoJCQlyZWd1bGF0b3ItYm9vdC1vbjsKCQkJcmVndWxhdG9yLWFsd2F5cy1vbjsKCQl9OwoKCQlk
Y2RjM19yZWc6IHJlZ3VsYXRvckAyIHsKCQkJLyogVkREX0NPUkUgdm9sdGFnZSBsaW1pdHMgMC45
NVYgLSAxLjFWIHdpdGggKy8tNCUgdG9sZXJhbmNlICovCgkJCXJlZ3VsYXRvci1uYW1lID0gInZk
ZF9jb3JlIjsKCQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8OTI1MDAwPjsKCQkJcmVndWxh
dG9yLW1heC1taWNyb3ZvbHQgPSA8MTE1MDAwMD47CgkJCXJlZ3VsYXRvci1ib290LW9uOwoJCQly
ZWd1bGF0b3ItYWx3YXlzLW9uOwoJCX07CgoJCWxkbzFfcmVnOiByZWd1bGF0b3JAMyB7CgkJCXJl
Z3VsYXRvci1hbHdheXMtb247CgkJfTsKCgkJbGRvMl9yZWc6IHJlZ3VsYXRvckA0IHsKCQkJcmVn
dWxhdG9yLWFsd2F5cy1vbjsKCQl9OwoKCQlsZG8zX3JlZzogcmVndWxhdG9yQDUgewoJCQlyZWd1
bGF0b3ItYWx3YXlzLW9uOwoJCX07CgoJCWxkbzRfcmVnOiByZWd1bGF0b3JANiB7CgkJCXJlZ3Vs
YXRvci1hbHdheXMtb247CgkJfTsKCX07Cn07CgoKCgoKCgo=

--_003_7D1F292BE8E4CC4F93079C1A7A58D5622BA96F34USNYGRMBX4raymo_
Content-Type: text/plain; name="am335x-boneblacknblue.dts.txt"
Content-Description: am335x-boneblacknblue.dts.txt
Content-Disposition: attachment; filename="am335x-boneblacknblue.dts.txt";
	size=658; creation-date="Wed, 30 Apr 2014 19:57:40 GMT";
	modification-date="Wed, 30 Apr 2014 19:57:40 GMT"
Content-Transfer-Encoding: base64

LyoKICogQ29weXJpZ2h0IChDKSAyMDEyIFRleGFzIEluc3RydW1lbnRzIEluY29ycG9yYXRlZCAt
IGh0dHA6Ly93d3cudGkuY29tLwogKgogKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsg
eW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogKiBpdCB1bmRlciB0aGUgdGVy
bXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcwogKiBwdWJs
aXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4KICovCi9kdHMtdjEvOwoKI2lu
Y2x1ZGUgImFtMzN4eC5kdHNpIgojaW5jbHVkZSAiYW0zMzV4LWJvbmVuYmx1ZS1jb21tb24uZHRz
aSIKCiZsZG8zX3JlZyB7CglyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKCXJl
Z3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDE4MDAwMDA+OwoJcmVndWxhdG9yLWFsd2F5cy1vbjsK
fTsKCiZtbWMxIHsKCXZtbWMtc3VwcGx5ID0gPCZ2bW1jc2RfZml4ZWQ+Owp9OwoKJm1tYzIgewoJ
dm1tYy1zdXBwbHkgPSA8JnZtbWNzZF9maXhlZD47CglwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
OwoJcGluY3RybC0wID0gPCZlbW1jX3BpbnM+OwoJYnVzLXdpZHRoID0gPDg+OwoJdGksbm9uLXJl
bW92YWJsZTsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCg==

--_003_7D1F292BE8E4CC4F93079C1A7A58D5622BA96F34USNYGRMBX4raymo_--
