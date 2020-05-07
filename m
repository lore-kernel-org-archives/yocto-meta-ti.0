Subject: Re: meta-ti setup suggestions for beaglebone (SoC AM335x)
To: meta-ti@lists.yoctoproject.org
From: yoc.dev@whitetree.xyz
X-Originating-Location: Tewkesbury, England, GB (86.142.173.66)
X-Originating-Platform: Linux Firefox 75
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 07 May 2020 02:50:01 -0700
References: <BfLY.1588763283272971866.HOsc@lists.yoctoproject.org>
In-Reply-To: <BfLY.1588763283272971866.HOsc@lists.yoctoproject.org>
Message-ID: <3193.1588845001912519601@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="r6YsI4V4PDtinZaVi0BT"

--r6YsI4V4PDtinZaVi0BT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Luca,

In the meta-ti repository this commit 7646efc16a2b0aeafb6790a7d18b8fa2ca45=
47ad added a wks script which by default creates an SD card image with 3 pa=
rtitions.

In the TI uboot code you will see that when booting from the MMC uboot exp=
ects there to be two partitions not three, hence your error.

include/configs/am335x_evm.h

lines 53 - 57

#define BOOTENV_DEV_LEGACY_MMC(devtypeu, devtypel, instance) \
"bootcmd_" #devtypel #instance "=3D" \
"setenv mmcdev " #instance"; "\
"setenv bootpart " #instance":2 ; "\
"run mmcboot\0"

To fix this you will want to include the following line in your local.conf=
 (or custom bsp layer):

WKS_FILE ?=3D "sdimage-bootpart.wks"

This will create a wic image which only has two partitions and you will be=
 able to boot from the MMC successfully. For reference the sdimage-bootpart=
.wks is part of poky.

To be clear I had this working using the meta-ti layer - with the change a=
bove and by setting the MACHINE variable to beaglebone.

Hope this helps!

Charlie

--r6YsI4V4PDtinZaVi0BT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Luca,<br /><br />In the meta-ti repository this commit 7646efc16a2b0aeaf=
b6790a7d18b8fa2ca4547ad added a wks script which by default creates an SD c=
ard image with 3 partitions.<br /><br />In the TI uboot code you will see t=
hat when booting from the MMC uboot expects there to be two partitions not =
three, hence your error.<br /><br />include/configs/am335x_evm.h<br /><br /=
>lines 53 - 57<br /><br />#define BOOTENV_DEV_LEGACY_MMC(devtypeu, devtypel=
, instance) \<br />&nbsp;&nbsp;&nbsp; "bootcmd_" #devtypel #instance "=3D" =
\<br />&nbsp;&nbsp;&nbsp; "setenv mmcdev " #instance"; "\<br />&nbsp;&nbsp;=
&nbsp; "setenv bootpart " #instance":2 ; "\<br />&nbsp;&nbsp;&nbsp; "run mm=
cboot\0"<br /><br />To fix this you will want to include the following line=
 in your local.conf (or custom bsp layer):<br /><br />WKS_FILE ?=3D "sdimag=
e-bootpart.wks"<br /><br />This will create a wic image which only has two =
partitions and you will be able to boot from the MMC successfully. For refe=
rence the sdimage-bootpart.wks is part of poky.<br /><br />To be clear I ha=
d this working using the meta-ti layer - with the change above and by setti=
ng the MACHINE variable to beaglebone.<br /><br />Hope this helps!<br /><br=
 />Charlie

--r6YsI4V4PDtinZaVi0BT--
