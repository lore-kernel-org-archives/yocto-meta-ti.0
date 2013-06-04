Return-Path: <mp.rdtr@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89EFEE014A5
	for <meta-ti@yoctoproject.org>; Tue,  4 Jun 2013 06:52:54 -0700 (PDT)
Received: by mail-oa0-f51.google.com with SMTP id f4so165313oah.10
	for <meta-ti@yoctoproject.org>; Tue, 04 Jun 2013 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=g1jNrW1JYAPxq+3N5zcmBnaw/Mr/Zh/8Z8gdZCSk8po=;
	b=rBoimvlBXE0pMCjqMoEdbXWAFd1SsoUqYEImKwIe7CdHQocruhjZZk20Y2xlD3T37K
	r46mgl1ULcyRW4cFI0jyzgOdVPQlJUkoG9bAPGtUET4n7iIeH6uj4nmQEwGPgI/5eI0M
	qnNLfcvXsh/ubBX1yfBAVRkFUpORoyR87gcmx4CX37F0WX7272Xp8vNi2mR5dTieVKS6
	hwIwRUgHVvoqKJTUZwd629I7/4NcaYB+mn/ycZdvI08dggHAVloncN9fTsWWc8De1wMW
	GyQSGu1tHbLKha3JtE7mDOdf+9QpB0s+QvV8h+hkBZjNqdf4SA0h89uoUt4jozieIlrF
	tbEA==
MIME-Version: 1.0
X-Received: by 10.182.80.65 with SMTP id p1mr12375875obx.42.1370353973538;
	Tue, 04 Jun 2013 06:52:53 -0700 (PDT)
Received: by 10.182.119.38 with HTTP; Tue, 4 Jun 2013 06:52:53 -0700 (PDT)
Date: Tue, 4 Jun 2013 15:52:53 +0200
Message-ID: <CAHEUgmwgz3=rC0OgQi_OZy6qLqbsORZ5cJRz=gEGzevBjWN8DQ@mail.gmail.com>
From: Reinhard Tartler <mp.rdtr@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Touchpad problems with beagleboard + uLCD7
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
X-List-Received-Date: Tue, 04 Jun 2013 13:52:54 -0000
Content-Type: multipart/alternative; boundary=047d7b2e44d4cf378d04de54650f

--047d7b2e44d4cf378d04de54650f
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm using YOCTO with the meta-ti layer, and managed to get the uLCD7
display working without the image being upside down.

However, I'm still having problems with the touchscreen. While it does
react to events, and ts_calibrate seems to operate fine, I notice that in
X, the screen remains uncalibrated:

 - in x-axis, the pointer moves faster than my finger on the touchscreen
 - in y-axis, the pointer moves in the opposite direction of my finger

presses do seem to work fine.

Does someone remember this problem, and could give me a hint what to do
here?

--047d7b2e44d4cf378d04de54650f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi,<br><br>I&#39;m using YOCTO with th=
e meta-ti layer, and managed to get the uLCD7 display working without the i=
mage being upside down.<br><br>However, I&#39;m still having problems with =
the touchscreen. While it does react to events, and ts_calibrate seems to o=
perate fine, I notice that in X, the screen remains uncalibrated:<br>
<br></div>=A0- in x-axis, the pointer moves faster than my finger on the to=
uchscreen<br></div>=A0- in y-axis, the pointer moves in the opposite direct=
ion of my finger<br><br></div>presses do seem to work fine.<br><br></div>Do=
es someone remember this problem, and could give me a hint what to do here?=
<br>
</div>

--047d7b2e44d4cf378d04de54650f--
