Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9167E011D1
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 00:51:02 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so3509800wib.11
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 00:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=xUxnviC7R7X5a8hyea2yeRyYR5GqcA9PH016o5myZNo=;
	b=T1vv+cpxaoiBIy8N0rUmP7jPzXOaxou70H9eUJPaRXxKgydRP96O5iFIvfNUS/0Scq
	lVXBZkexzTXc6PWsiy8xhkj42Se7r1k85mv7eUgmeL1eBO7io+DoPGAk1IBPdxtTEAec
	Ec8WdKV3nuuoMXAnIQ9W3ep4oght+R38FmDcasBO6WPjio6gJmsYynA+Y0SgM+GKSEna
	iqrG316wg7DFZKEZn9xgLkAQQv67D5fszvZD2wPsXR5e5A1+XCdQEvtCSeQ2/oOL96z1
	3ZWBDwm1wpqpSuzmcebMVPIrVu98nMCiv8qxbeWmKEg0DM5vLu+6s/ZYA/EvYkxw/ADd
	0RNw==
MIME-Version: 1.0
Received: by 10.216.132.222 with SMTP id o72mr3175872wei.95.1331797861634;
	Thu, 15 Mar 2012 00:51:01 -0700 (PDT)
Received: by 10.223.101.202 with HTTP; Thu, 15 Mar 2012 00:51:01 -0700 (PDT)
In-Reply-To: <CAGiJk9e8hi80AB4R6+E8TgmosYXFx=y768oOah3S++w=zKthZg@mail.gmail.com>
References: <CAGiJk9e8hi80AB4R6+E8TgmosYXFx=y768oOah3S++w=zKthZg@mail.gmail.com>
Date: Thu, 15 Mar 2012 08:51:01 +0100
Message-ID: <CAGiJk9fOyxDASHkFR_VFzYfgoKke0rkFhSavfRGRenNgstzvVA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: meta-ti@yoctoproject.org
Subject: OpenGL ES on OMAP 3530
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Mar 2012 07:51:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

currently I've been trying to get the OpenGL ES drivers working on a
Gumstix Overo.
Building the recipe works without problems, but running any examples
or demo applications that ship with the driver won't work.

When starting the application from the console (or from xfce) this log
message will show up:
-
PVRShell: EGL Error (EGL_BAD_ALLOC)
InitAPI failed!
PVRShell: Unable to initialise EGL
xinit: connection to X server lost
-


Also the pvr-init service seems to fail after the first boot:
-
root@overo:~# systemctl start pvr-init.service
Starting PVR
insmod: error inserting
'/lib/modules/3.0.17+/kernel/drivers/gpu/pvr/pvrsrvkm.ko': -1 File
exists
Job failed. See system logs and 'systemctl status' for details.
-

The board has ES version 3.1, and in /etc/powervr.esrev the right value is =
set:
root@overo:/etc# cat powervr-esrev
3



Starting pvrsrvinit will fail silently with exit code 1, lsmod shows
that the modules where loaded:
root@overo:~# lsmod
Module =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Usedb=
y
bufferclass_ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A04676 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
omaplfb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 11006 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0
pvrsrvkm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0143426  =C2=A0 =C2=A0 =C2=A02 bufferclass_ti,omaplf=
b
twl4030_madc_hwmon =C2=A0 =C2=A0 =C2=A01611 =C2=A0 =C2=A0  =C2=A0 =C2=A0 =
=C2=A00
ads7846 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0  8504 =C2=A0 =C2=A0 =C2=A0  =C2=A0 =C2=A00
ipv6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0239972 =C2=A0 =C2=A0 =C2=A016


Any ideas how I could get at least the demos running?

--
Regards
Samuel

