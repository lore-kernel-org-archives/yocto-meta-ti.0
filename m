Return-Path: <exosyst@gmail.com>
Received: from mail-pz0-f48.google.com (mail-pz0-f48.google.com
	[209.85.210.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 031E8E013EB
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 09:12:17 -0700 (PDT)
Received: by dadz8 with SMTP id z8so1517282dad.35
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 09:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=RV/PWO4JtoNyu2fLVVAHgFHAO+F2P7MuUkN9Hv6VhGs=;
	b=0rF0UWaDAgc8hV8b9ug1L7S5SfsLgmdn5qYyWDhbvsaWfkLweBU4T11gaMeJGfWgAh
	Hs0caFHVQYOl+RLgW3HyT4y+p1OPFpKcpWB7nkJni5n0EdGyTmyUu+WQWaN4s2xes5c/
	FZaht7GudUY70RWixeM5wIK8A9z4FFUq5SwzlLyg/dOEDvcbWaz6pmti9nW9IKxXTh94
	zqY7c2oBS438ukz3zhFWk+jN0ZlW7UQsdf2cp/wQ5/9qtPbq+69xB9tOR+31zuauZGcV
	rsi6rXB1YMAQM8hFI2wHqsCRHnUlqe2RW2x+X3HInq/7mhPaijT6lO3hysAClBtDDxv9
	XycQ==
Received: by 10.68.200.199 with SMTP id ju7mr17306095pbc.36.1337184737538;
	Wed, 16 May 2012 09:12:17 -0700 (PDT)
MIME-Version: 1.0
Sender: exosyst@gmail.com
Received: by 10.68.204.162 with HTTP; Wed, 16 May 2012 09:11:57 -0700 (PDT)
From: Nick G <exosyst+metaTI@gmail.com>
Date: Wed, 16 May 2012 17:11:57 +0100
X-Google-Sender-Auth: ozlaUVRK608_ShEr1NauQFpcxx8
Message-ID: <CAN-pQAQhz3g_R-UvX8Fqv9My944rU-47Kwff1h1JV=kj1M3-FQ@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Reference to am335x-pm-firmware.bin is hardcoded
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
X-List-Received-Date: Wed, 16 May 2012 16:12:18 -0000
Content-Type: multipart/alternative; boundary=047d7b15ae3b47b20604c0299574

--047d7b15ae3b47b20604c0299574
Content-Type: text/plain; charset=ISO-8859-1

The file firmware/am335x-pm-firmware.bin.gen.S contains a hardcoded path -
in my case it was set to
/media/scratch/poky-git/beaglebone/tmp/work/beaglebone-poky-linux-gnueabi/linux-ti33x-psp-3.2-r0/git/firmware/am335x-pm-firmware.bin

The firmware binary, am335x-pm-firmware.bin, is successfully copied into
the directory but the hardcoded reference remains.

That patch for this is trivial in the kernel source - just strip the
location back to "firmware/am335x-pm-firmware.bin" but I'm not sure how to
fix this with the meta-ti layer but would be happy to do so with
instruction.

Regards,
Nick

--047d7b15ae3b47b20604c0299574
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The file firmware/am335x-pm-firmware.bin.gen.S contains a hardcoded path - =
in my case it was set to /media/scratch/poky-git/beaglebone/tmp/work/beagle=
bone-poky-linux-gnueabi/linux-ti33x-psp-3.2-r0/git/firmware/am335x-pm-firmw=
are.bin<br>

<br>The firmware binary, am335x-pm-firmware.bin, is successfully copied int=
o the directory but the hardcoded reference remains.<br><br>That patch for =
this is trivial in the kernel source - just strip the location back to &quo=
t;firmware/am335x-pm-firmware.bin&quot; but I&#39;m not sure how to fix thi=
s with the meta-ti layer but would be happy to do so with instruction.<br>

<br>Regards,<br>Nick<br><br>

--047d7b15ae3b47b20604c0299574--
