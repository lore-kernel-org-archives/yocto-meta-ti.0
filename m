Return-Path: <kenny@understoryweather.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A073E00BD6; Fri, 23 Jun 2017 19:50:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.217.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE2E2E00B28
	for <meta-ti@yoctoproject.org>; Fri, 23 Jun 2017 19:50:43 -0700 (PDT)
Received: by mail-ua0-f176.google.com with SMTP id 70so46554780uau.0
	for <meta-ti@yoctoproject.org>; Fri, 23 Jun 2017 19:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=understoryweather-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=+dX/icZPs+GVOnpMWwJuDdOIpqmqkQBwOpNdaIOpZPI=;
	b=WRQP5iSBxcrkF2nRmttp7Ir21TdkIb2PQ29Xaf9I0NTOHxB8gqmOSIHeG1FkfMBQrh
	M2tjQPHs14AwVPctyhqjxyhPfU3j5rIhhN91b2kgJRnrOSwS7fBeJslhkFkaP1IOHpHl
	6w+tRjoewjYUE5NAMLkGgF9E5Vy6oiDcMPnYXRTVtx0i0c9k8aS3m03G1/TZjY3UCzwj
	vZzSkCqpbmBAUcDV2naJW1pV+lmqVQ5eszmhWF/s81Zn1X6qTzP7B1eNvt2T+vzUqZkk
	TiONHAF0a0vhbc2j8+3o/MSYwg/lUTaxqUx9n4YiYi60UTePLXwb1lMx3To8WMfOAQTs
	gN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=+dX/icZPs+GVOnpMWwJuDdOIpqmqkQBwOpNdaIOpZPI=;
	b=kYrO1wOJFj7e0CdzgsftVmGZcrIIgMdk2MMa2C5+aGQ9TCPQ8HoWlY0Hp+qjchAtOM
	HNVygZQOGSGvDmsDzBZI+FqxIIRRJozZ8doX+ZWEiUVZE5RyNLPlptfD1c9VxVycROoD
	XpQtym87gcLGsgH7lqt9C0IvU0VllI7CjoXfL2kAXJn5a5Hz/qpKvpgX/rdNy4TEpWm9
	3Sxdb1eHvs/qhPBr8hAQiAZ2AcQDdCGbvZwqeFHi6jxk+205u9ddVikFhtTtABQotkc8
	cb9/o5PlhDYsTxD9S0AmsgTbYFw1CY9kdebMbw+uFSVTWvdnyixqfOLfj+b3nYccgZLd
	8/tA==
X-Gm-Message-State: AKS2vOwvTgj157XcqxsJwl9Hk4B9PAnpopvfBdykZ6A4Cbgpn4rD6QpE
	jiABUhtz8DTUTXQ6nX/3Q7Jf+IkZoUtZA3s=
X-Received: by 10.176.3.117 with SMTP id 108mr8417245uat.56.1498272642780;
	Fri, 23 Jun 2017 19:50:42 -0700 (PDT)
MIME-Version: 1.0
From: Kenny Koller <kenny@understoryweather.com>
Date: Sat, 24 Jun 2017 02:50:32 +0000
Message-ID: <CAPtqgUwJnmq+TNdrr7odqrpfwsxE8Z=c8GKnNez3maf6wBUupw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: install cannot stat u-boot.img (Pyro)
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
X-List-Received-Date: Sat, 24 Jun 2017 02:50:57 -0000
Content-Type: multipart/alternative; boundary="001a113d1982a6711b0552abc8c8"

--001a113d1982a6711b0552abc8c8
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm using 2.3 to build the minimal Beaglebone Black images.

I issue the following and get the error below. Is the warning regarding a
missing bootloader config the issue?

Thanks,

Kenny

$ bitbake core-image-minimal

| INFO: Creating image(s)...
|
| WARNING: bootloader config not specified, using defaults
|
| ERROR: _exec_cmd: install -m 0644 -D
/home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/u-boot.img
/home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-beaglebone-20170624014756/tmp.wic.khxryxga/boot/u-boot.img
returned '1' instead of 0
| output: install: cannot stat
'/home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/u-boot.img': No
such file or directory
|
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_image_wic (log file is located at
/home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_wic.12719)
ERROR: Task
(/home/ubuntu/yocto/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_wic)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2263 tasks of which 2252 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:
  /home/ubuntu/yocto/poky/meta/recipes-core/images/core-image-minimal.bb:
do_image_wic
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--001a113d1982a6711b0552abc8c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m using 2.3 to build the mini=
mal Beaglebone Black images.</div><div><br></div><div>I issue the following=
 and get the error below. Is the warning regarding a missing bootloader con=
fig the issue?</div><div><br></div><div>Thanks,</div><div><br></div><div>Ke=
nny</div><div><br></div><div>$ bitbake core-image-minimal</div><div><br></d=
iv><div><div><font face=3D"monospace">| INFO: Creating image(s)...</font></=
div><div><font face=3D"monospace">|=C2=A0</font></div><div><font face=3D"mo=
nospace">| WARNING: bootloader config not specified, using defaults</font><=
/div><div><font face=3D"monospace">|=C2=A0</font></div><div><font face=3D"m=
onospace">| ERROR: _exec_cmd: install -m 0644 -D /home/ubuntu/yocto/poky/bu=
ild/tmp/deploy/images/beaglebone/u-boot.img /home/ubuntu/yocto/poky/build/t=
mp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core=
-image-minimal-image-complete/core-image-minimal-beaglebone-20170624014756/=
tmp.wic.khxryxga/boot/u-boot.img returned &#39;1&#39; instead of 0</font></=
div><div><font face=3D"monospace">| output: install: cannot stat &#39;/home=
/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/u-boot.img&#39;: No s=
uch file or directory</font></div><div><font face=3D"monospace">|=C2=A0</fo=
nt></div><div><font face=3D"monospace">| WARNING: exit code 1 from a shell =
command.</font></div><div><font face=3D"monospace">| ERROR: Function failed=
: do_image_wic (log file is located at /home/ubuntu/yocto/poky/build/tmp/wo=
rk/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_imag=
e_wic.12719)</font></div><div><font face=3D"monospace">ERROR: Task (/home/u=
buntu/yocto/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_wi=
c) failed with exit code &#39;1&#39;</font></div><div><font face=3D"monospa=
ce">NOTE: Tasks Summary: Attempted 2263 tasks of which 2252 didn&#39;t need=
 to be rerun and 1 failed.</font></div><div><font face=3D"monospace"><br></=
font></div><div><font face=3D"monospace">Summary: 1 task failed:</font></di=
v><div><font face=3D"monospace">=C2=A0 /home/ubuntu/yocto/poky/meta/recipes=
-core/images/core-image-minimal.bb:do_image_wic</font></div><div><font face=
=3D"monospace">Summary: There was 1 ERROR message shown, returning a non-ze=
ro exit code.</font></div></div></div>

--001a113d1982a6711b0552abc8c8--
