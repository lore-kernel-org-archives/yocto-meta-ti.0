Return-Path: <simon.pelletiert@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D8A5E00C75; Fri,  7 Oct 2016 18:49:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (simon.pelletiert[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.169 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.169 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2435E009F0
	for <meta-ti@yoctoproject.org>; Fri,  7 Oct 2016 18:49:16 -0700 (PDT)
Received: by mail-qk0-f169.google.com with SMTP id f128so37841737qkb.1
	for <meta-ti@yoctoproject.org>; Fri, 07 Oct 2016 18:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=tJipPqOlcBP+oCSiAnqSm6Fwm61OC3TZ/qj6WisNCjI=;
	b=Sh1v+eKFN8Ic+eAHwvAggdPNLClwFf2cC7eybPH3Kx0tnha/GhvWtUljH1pc1XdJNH
	5fXLjYMJwkfgbbYrHGTCPXOc6+tNXYm2ZVVVykC1t9bauw4wblNYJq0dgiZH2GJY9oIH
	ecFbSr9FvFRGId+CVxPkE1ap5+0IOc+IuKCian4WFhWKSX+Lvxpml7FJyr7CULx7kvcI
	faNS2xn1N/05bLFzTLWcLEgygnEC7o9HkUFNww2g1Vk22la+WzAW5J9xZw0fH7p89Axj
	8XOUE4UCMu+qEA24DdF4TiOD0FbZowM3fmc/2yYzdyFYT37SsH5mc3lDzRO2pkl507ew
	ZKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=tJipPqOlcBP+oCSiAnqSm6Fwm61OC3TZ/qj6WisNCjI=;
	b=JCw+LysydsG4pYJ4lfWkbx4ehSRfRfnEIE3tYItTMWydrEc4zTzW82a5ITg6XALjSg
	4Zjm0D2+fbpiHAYG4Y0f5NNfFhJe8NMhJM/r1C5EKw+drNc9makNhCkHn6NaN6mW9D8+
	o1a0BdApFt8UhV+tCYI6iUcHa25/8BjrxYoulOndXlKeMmKhZUXFYuM7aqu8ysrqF14P
	9XWzPYZBJbQcAkGUriMqHoCM/16VQUpPz50LiAW67oj4VJkAp757Supef0K5lqUFOZTL
	GW3w8Lt247ysiroV77CPpLjyU5XdFhDq2FXMYuaU19aeYpVHxgfxotnSQ+PSOh5YyHBs
	XEWg==
X-Gm-Message-State: AA6/9Rnqbiqo5ksi9Na09O5dNrrAFpx2FAjpVv/y4SgCTV4W1KS09jnsfHe2Agnqa7ctEQ0Ud9tva8EIopzNfQ==
X-Received: by 10.55.68.81 with SMTP id r78mr21309359qka.310.1475891355365;
	Fri, 07 Oct 2016 18:49:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.164 with HTTP; Fri, 7 Oct 2016 18:49:14 -0700 (PDT)
From: Simon Pelletier-Thibault <simon.pelletiert@gmail.com>
Date: Fri, 7 Oct 2016 21:49:14 -0400
Message-ID: <CAMUfapSLsRQiC=ugzRWLJHqFS-PzV9evCx0CQtWRqzdO=vC6GA@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: BeagleBone Black - ti-sgx-ddk not working on yocto Krogoth, what is missing
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
X-List-Received-Date: Sat, 08 Oct 2016 01:49:17 -0000
Content-Type: multipart/alternative; boundary=001a11489f34f6b44a053e50bbe4

--001a11489f34f6b44a053e50bbe4
Content-Type: text/plain; charset=UTF-8

Hi,

I'm trying to use sgx driver for EGL application on BeagleBone Black. I
build a minimal image to test it and it is not working.

I got this:
root@beaglebone:~# sgx_init_test
----------------------- Start -----------------------
Try calling PVRSRVConnect with an invalid argument:
PVR:(Error): PVRSRVConnect: Invalid connection. [0, ]
PVR:(Error): PVRSRVConnect: Unable to open connection. [0, ]
 OK
Call PVRSRVConnect with a valid argument:
 OK
Try calling PVRSRVEnumerateDevices with invalid puiNumDevices:
PVR:(Error): PVRSRVEnumerateDevices: Invalid params [0, ]
 OK
Get number of devices from PVRSRVEnumerateDevices:
 OK
.... Reported 1 devices
.... Device Number  | Device Type
            0000    | PVRSRV_DEVICE_ID_SGX
Attempt to acquire device 0:
 OK
Getting SGX Client info
 OK
.... ui32ProcessID:266
Display Class API: enumerate devices
 OK
PVRSRVEnumerateDeviceClass() returns 0 display device(s)
 FAIL - PVRSRV_ERROR_NO_DC_DEVICES_FOUND
-----

Here my configuration:
bblayes.conf:
POKY_BBLAYERS_CONF_VERSION = "2"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  /path/poky2.1/meta \
  /path/poky2.1/meta-poky \
  /path/meta-ti2 \
  "
-----

local.conf:
PACKAGECONFIG_append_pn-qemu-native = " sdl"
PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
CONF_VERSION = "1"

PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"

IMAGE_INSTALL_append_pn-core-image-minimal = " packagegroup-base-vfat
packagegroup-base-usbhost dropbear linux-firmware ti-sgx-ddk-km
ti-sgx-ddk-um libdrm"

-----

What am I missing?

I try other configurations, like core-image-weston. After "adjusting" mesa
so it won't install gbm, weston won't boot and I still get the previous
error.

Thank you.

Simon

--001a11489f34f6b44a053e50bbe4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi,<br><br></div>I&#39;m trying to use=
 sgx driver for EGL application on BeagleBone Black. I build a minimal imag=
e to test it and it is not working.<br><br></div>I got this:<br>root@beagle=
bone:~# sgx_init_test<br>----------------------- Start --------------------=
---<br>Try calling PVRSRVConnect with an invalid argument:<br>PVR:(Error): =
PVRSRVConnect: Invalid connection. [0, ]<br>PVR:(Error): PVRSRVConnect: Una=
ble to open connection. [0, ]<br>=C2=A0OK<br>Call PVRSRVConnect with a vali=
d argument:<br>=C2=A0OK<br>Try calling PVRSRVEnumerateDevices with invalid =
puiNumDevices:<br>PVR:(Error): PVRSRVEnumerateDevices: Invalid params [0, ]=
<br>=C2=A0OK<br>Get number of devices from PVRSRVEnumerateDevices:<br>=C2=
=A0OK<br>.... Reported 1 devices<br>.... Device Number=C2=A0 | Device Type<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0000=
=C2=A0=C2=A0=C2=A0 | PVRSRV_DEVICE_ID_SGX<br>Attempt to acquire device 0:<b=
r>=C2=A0OK<br>Getting SGX Client info<br>=C2=A0OK<br>.... ui32ProcessID:266=
<br>Display Class API: enumerate devices<br>=C2=A0OK<br>PVRSRVEnumerateDevi=
ceClass() returns 0 display device(s)<br>=C2=A0FAIL - PVRSRV_ERROR_NO_DC_DE=
VICES_FOUND<br>-----<br><br></div>Here my configuration:<br>bblayes.conf:<b=
r>POKY_BBLAYERS_CONF_VERSION =3D &quot;2&quot;<br><br>BBPATH =3D &quot;${TO=
PDIR}&quot;<br>BBFILES ?=3D &quot;&quot;<br><br>BBLAYERS ?=3D &quot; \<br>=
=C2=A0 /path/poky2.1/meta \<br>=C2=A0 /path/poky2.1/meta-poky \<br>=C2=A0 /=
path/meta-ti2 \<br></div><div><div>=C2=A0 &quot;<br></div><div>-----<br><br=
>local.conf:<br>PACKAGECONFIG_append_pn-qemu-native =3D &quot; sdl&quot;<br=
>PACKAGECONFIG_append_pn-nativesdk-qemu =3D &quot; sdl&quot;<br>CONF_VERSIO=
N =3D &quot;1&quot;<br><br>PREFERRED_PROVIDER_virtual/egl =3D &quot;ti-sgx-=
ddk-um&quot;<br>PREFERRED_PROVIDER_virtual/libgles1 =3D &quot;ti-sgx-ddk-um=
&quot;<br>PREFERRED_PROVIDER_virtual/libgles2 =3D &quot;ti-sgx-ddk-um&quot;=
<br><br>IMAGE_INSTALL_append_pn-core-image-minimal =3D &quot; packagegroup-=
base-vfat packagegroup-base-usbhost dropbear linux-firmware ti-sgx-ddk-km t=
i-sgx-ddk-um libdrm&quot;<br><br>-----<br><br></div><div>What am I missing?=
<br><br>I try other configurations, like core-image-weston. After &quot;adj=
usting&quot; mesa so it won&#39;t install gbm, weston won&#39;t boot and I =
still get the previous error.<br><br></div><div>Thank you.<br><br></div><di=
v>Simon<br></div><div><br></div></div></div>

--001a11489f34f6b44a053e50bbe4--
