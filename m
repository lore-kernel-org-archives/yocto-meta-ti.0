Return-Path: <hirst689@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66100E01457
	for <meta-ti@yoctoproject.org>; Fri, 22 Mar 2013 07:31:49 -0700 (PDT)
Received: by mail-pd0-f180.google.com with SMTP id g10so1629588pdj.25
	for <meta-ti@yoctoproject.org>; Fri, 22 Mar 2013 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=h3VGFQiCMl3xE7mEYL7NCt3w0dKWBQV76D2uC0EhUZw=;
	b=uznSKunh0es2k/uD3rHkxDYddxm5sQttJFPU0R/AA9XScat37rEoc1nGNGu/UoqWos
	Ql/kq/5gmacZLRUKyiN8aRck+IKvbJDfajBXf4EOmCCYptBHaofZ73lqDVsnYwDYP1O5
	0jxS7neD9PFJi0fju33jD2IQEI1oKWxcSqcJMQsgwKbgmwL4hGscB3aVFydmjs1sVBwo
	Ylsw4KvUfQsbzxf+sPOj2UoaJEHSvUHolUU4kO5FBI+e5g0K2QFKOjhIvM7g5ueZ8pdY
	sth0VyyduI02DFlbHJp4GgNb2fGB8ZjYGYnweCqXYSBqQ8h0nuP8K+GDjXqdr4kzDbLS
	ObTg==
MIME-Version: 1.0
X-Received: by 10.68.134.38 with SMTP id ph6mr2830939pbb.205.1363962709223;
	Fri, 22 Mar 2013 07:31:49 -0700 (PDT)
Received: by 10.68.225.166 with HTTP; Fri, 22 Mar 2013 07:31:49 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:31:49 -0400
Message-ID: <CAHu+ux3bSH_q0ZwAv94v-5AKJDtPd=ityWisQtzTv_qz2NpTNg@mail.gmail.com>
From: David Hirst <hirst689@gmail.com>
To: meta-ti@yoctoproject.org
Subject: adding a recipe to oe/bitbake for tisdk-rootfs-image
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
X-List-Received-Date: Fri, 22 Mar 2013 14:31:49 -0000
Content-Type: multipart/alternative; boundary=047d7b10c89bc52e0404d884507a

--047d7b10c89bc52e0404d884507a
Content-Type: text/plain; charset=ISO-8859-1

Hi,
    I have been struggling with a oe/bitbake issue. I wanted to add an
other .bb to the image file.
I have tried multiple ways but always end up at the same spot. I have
created a new task-XXX.bb file which includes my bb
I edited the tisdk-rootfs-image.bb to include the task-XXX.bb.
Once built I find that everything built fine and the new recipe was built
but was not loaded into the tosdk-rootfs-image.tar,gz.
If I look into the image directory for the bb file I see the compiled
application in usr/sbin.
I have tried this with my own .bb file and net-snmp bb file which comes
with the default oe-layersetup installation with the same result.
Did I not edit a file or miss some other required step?

-- 
David Hirst
hirst689@gmail.com

--047d7b10c89bc52e0404d884507a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br>=A0=A0=A0 I have been struggling with a oe/bitbake issue. I wanted t=
o add an other .bb to the image file.<br>I have tried multiple ways but alw=
ays end up at the same spot. I have created a new task-XXX.bb file which in=
cludes my bb<br>
I edited the <a href=3D"http://tisdk-rootfs-image.bb">tisdk-rootfs-image.bb=
</a> to include the task-XXX.bb.<br>Once built I find that everything built=
 fine and the new recipe was built but was not loaded into the tosdk-rootfs=
-image.tar,gz.<br>
If I look into the image directory for the bb file I see the compiled appli=
cation in usr/sbin.<br>I
 have tried this with my own .bb file and net-snmp bb file which comes=20
with the default oe-layersetup installation with the same result.<br>Did I =
not edit a file or miss some other required step?<br clear=3D"all"><br>-- <=
br>David Hirst<br><a href=3D"mailto:hirst689@gmail.com" target=3D"_blank">h=
irst689@gmail.com</a><br>
<img src=3D"" alt=3D""><br>

--047d7b10c89bc52e0404d884507a--
