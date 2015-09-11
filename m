Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A48CE00CF5; Fri, 11 Sep 2015 02:05:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.bimmermann[at]yahoo.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.82.96.229 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm18-vm5.bullet.mail.ir2.yahoo.com
	(nm18-vm5.bullet.mail.ir2.yahoo.com [212.82.96.229])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F74EE00B85
	for <meta-ti@yoctoproject.org>; Fri, 11 Sep 2015 02:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1441962345; bh=KspzUrQEO58EC3GMFYSn5StSBwIUGeFCbgRZ7MeRN0E=;
	h=Date:From:Reply-To:To:Subject:From:Subject;
	b=OwtUwKH9sU548cCaduRXVNktxbde0YcDTVNGc8eGyuI6CPoXWt3ie4CCunEWgekkUj5S0CMvtbM3Z96dMk7KP9Iih7/Hvf56NVXjH4kbGUw6zjJaK0UxCJm2Y9txaW7054X3Zv40ijTaYMfwp5J70XoFIb646ZfE9VoEeFKRCB7xRQF3Kaq0COnwwZ0l6Ny/bIfWMuVmIokKoa6eS2srDI7K7jqnUe0ist2CmDHALKFvW3XR3SpwwwD5YLUbhEI5Wa42z373IZy7RufjstARRl8MkAGOHnazCnGYc8S9OoOy0UXRK1BjdCc18OhyYIsEmmcGn4jIB84fnKA34SxQ8Q==
Received: from [212.82.98.125] by nm18.bullet.mail.ir2.yahoo.com with NNFMP;
	11 Sep 2015 09:05:45 -0000
Received: from [212.82.98.98] by tm18.bullet.mail.ir2.yahoo.com with NNFMP;
	11 Sep 2015 09:05:45 -0000
Received: from [127.0.0.1] by omp1035.mail.ir2.yahoo.com with NNFMP;
	11 Sep 2015 09:05:45 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 226035.56093.bm@omp1035.mail.ir2.yahoo.com
X-YMail-OSG: tYgLIhMVM1nhJzm8mrj8g77_5XZuX_9ZvkNb9EEh85SZEYfyK0vAHKSCGaVHGhv
	_jtQCCOmFwZsNMwhZ8xAClX0IybLoIM2YhAngTw10DrjuctMzLt3nBYFba4w6NLS1gdFiJUKmbs3
	IK7TVPxv2R9EorP5NMcfO_JBBHbc3o0R5OppiUVfzE0FtC9Qw8HFlc90X4JR14fA_kr7pQ9tpN3I
	B6H.S1n43DlYTijEsiYgMjH6xYGefERdGcbx0QFFIuANUow0vMBBm39Z.6ECC96Q5mC2h6z9V_8d
	rE8XX3QOrpV3DP.ua1fpOXNGX1fCPwZy_MgkDFkEdZNgDEU.7XgK7F6VjvosAp6qn_GHOGXBQEoF
	7Djb6qOINWATyOZcaoTZeS554NtAe2iQ1hZ0tvQPdHUiEDkRDXhR7QHW1hnhcdJlnygkHrLeUsgy
	wZ_3Iy9L1KlEF9d6wdjFBcuCGZ4th18Mu0E3HHTQxWWX7AcjAqotbVMjJNZ7q8r40rBk.VH3XLwO
	na18QI2makktqn70eHGqAs6iMNYLuTxppNhjwYirV9Ybk_IFw
Received: by 212.82.98.123; Fri, 11 Sep 2015 09:05:44 +0000 
Date: Fri, 11 Sep 2015 09:05:42 +0000 (UTC)
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, 
	Denys Dmytriyenko <denys@ti.com>
Message-ID: <431866311.1106194.1441962342645.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Subject: Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin | checksum mismatch
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Benjamin Bimmermann <b.bimmermann@yahoo.de>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Sep 2015 09:05:51 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_1106193_1765318567.1441962342642"

------=_Part_1106193_1765318567.1441962342642
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,
I have a checksum mismatch. Have you upgrade to a new Version without chang=
e the checksum ?
Second question : If you have update the omap3, has omap3 now Wayland suppo=
rt and is omap3 now ready for the Kernel 4.1.X ?
Have a nice day.

log :
WARNING: Renaming DIR/build_new/downloads/Graphics_SDK_setuplinux_hardfp_5_=
01_01_02.bin to DIR/build_new/downloads/Graphics_SDK_setuplinux_hardfp_5_01=
_01_02.bin_bad-checksum_e71bc0d68048f5f9f17c6ec899e3c9f4
ERROR: Fetcher failure for URL: 'http://software-dl.ti.com/dsps/dsps_public=
_sw/gfxsdk/5_01_01_02/exports/Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin=
'. Checksum mismatch!
File: 'DIR/build_new/downloads/Graphics_SDK_setuplinux_hardfp_5_01_01_02.bi=
n' has md5 checksum e71bc0d68048f5f9f17c6ec899e3c9f4 when 94bcb31ea7eb50df1=
dfa4037055b638e was expected
File: 'DIR/build_new/downloads/Graphics_SDK_setuplinux_hardfp_5_01_01_02.bi=
n' has sha256 checksum e72e1eb512cb66a5390b675a90228a762d026e71fa1bb2f11f23=
5d9198645277 when 54641222cdb49b03f996cbd6412de227198d9e084f5647d706bbf4217=
e8cdb07 was expected
If this change is expected (e.g. you have upgraded to a new version without=
 updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] =3D "e71bc0d68048f5f9f17c6ec899e3c9f4"
SRC_URI[sha256sum] =3D "e72e1eb512cb66a5390b675a90228a762d026e71fa1bb2f11f2=
35d9198645277"
Otherwise you should retry the download and/or check with upstream to deter=
mine if the file has become corrupted or otherwise unexpectedly modified.

ERROR: Function failed: Fetcher failure for URL: 'http://software-dl.ti.com=
/dsps/dsps_public_sw/gfxsdk/5_01_01_02/exports/Graphics_SDK_setuplinux_hard=
fp_5_01_01_02.bin'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: DIR/build_new/tmp/work/beaglebone-poky=
-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_fetch.22324
ERROR: Task 2918 (DIR/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules=
_5.01.01.02.bb, do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1146 tasks of which 0 didn't need to be reru=
n and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
=C2=A0 DIR/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02=
.bb, do_fetch


------=_Part_1106193_1765318567.1441962342642
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:16px"><div id=3D"yui_3_16_0=
_1_1441961927026_2673">Hello,</div><div id=3D"yui_3_16_0_1_1441961927026_29=
78" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1441961927026_2979" dir=
=3D"ltr">I have a checksum mismatch. Have you upgrade to a new Version with=
out change the checksum ?</div><div id=3D"yui_3_16_0_1_1441961927026_2915" =
dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1441961927026_3100" dir=3D"lt=
r">Second question : If you have update the omap3, has omap3 now Wayland su=
pport and is omap3 now ready for the Kernel 4.1.X ?</div><div id=3D"yui_3_1=
6_0_1_1441961927026_3151" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_144=
1961927026_3152" dir=3D"ltr">Have a nice day.<br></div><div id=3D"yui_3_16_=
0_1_1441961927026_3101" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_14419=
61927026_2929" dir=3D"ltr">log :</div><div id=3D"yui_3_16_0_1_1441961927026=
_2980" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1441961927026_2981" di=
r=3D"ltr">WARNING: Renaming DIR/build_new/downloads/Graphics_SDK_setuplinux=
_hardfp_5_01_01_02.bin to DIR/build_new/downloads/Graphics_SDK_setuplinux_h=
ardfp_5_01_01_02.bin_bad-checksum_e71bc0d68048f5f9f17c6ec899e3c9f4<br class=
=3D"">ERROR: Fetcher failure for URL: 'http://software-dl.ti.com/dsps/dsps_=
public_sw/gfxsdk/5_01_01_02/exports/Graphics_SDK_setuplinux_hardfp_5_01_01_=
02.bin'. Checksum mismatch!<br class=3D"">File: 'DIR/build_new/downloads/Gr=
aphics_SDK_setuplinux_hardfp_5_01_01_02.bin' has md5 checksum e71bc0d68048f=
5f9f17c6ec899e3c9f4 when 94bcb31ea7eb50df1dfa4037055b638e was expected<br c=
lass=3D"">File: 'DIR/build_new/downloads/Graphics_SDK_setuplinux_hardfp_5_0=
1_01_02.bin' has sha256 checksum e72e1eb512cb66a5390b675a90228a762d026e71fa=
1bb2f11f235d9198645277 when 54641222cdb49b03f996cbd6412de227198d9e084f5647d=
706bbf4217e8cdb07 was expected<br class=3D"">If this change is expected (e.=
g. you have upgraded to a new version without updating the checksums) then =
you can use these lines within the recipe:<br class=3D"">SRC_URI[md5sum] =
=3D "e71bc0d68048f5f9f17c6ec899e3c9f4"<br class=3D"">SRC_URI[sha256sum] =3D=
 "e72e1eb512cb66a5390b675a90228a762d026e71fa1bb2f11f235d9198645277"<br clas=
s=3D"">Otherwise you should retry the download and/or check with upstream t=
o determine if the file has become corrupted or otherwise unexpectedly modi=
fied.<br class=3D""><br class=3D"">ERROR: Function failed: Fetcher failure =
for URL: 'http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/5_01_01_02/e=
xports/Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin'. Unable to fetch URL =
from any source.<br class=3D"">ERROR: Logfile of failure stored in: DIR/bui=
ld_new/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-=
r22b/temp/log.do_fetch.22324<br class=3D"">ERROR: Task 2918 (DIR/meta-ti/re=
cipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb, do_fetch) failed=
 with exit code '1'<br class=3D"">NOTE: Tasks Summary: Attempted 1146 tasks=
 of which 0 didn't need to be rerun and 1 failed.<br class=3D"">Waiting for=
 0 running tasks to finish:<br class=3D""><br class=3D"">Summary: 1 task fa=
iled:<br class=3D"">&nbsp; DIR/meta-ti/recipes-bsp/powervr-drivers/omap3-sg=
x-modules_5.01.01.02.bb, do_fetch<br></div><div id=3D"yui_3_16_0_1_14419619=
27026_2916" dir=3D"ltr"><br></div></div></body></html>

------=_Part_1106193_1765318567.1441962342642--
