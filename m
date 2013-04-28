Return-Path: <jon.szymaniak@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A663FE00310
	for <meta-ti@yoctoproject.org>; Sun, 28 Apr 2013 10:51:16 -0700 (PDT)
Received: by mail-wg0-f43.google.com with SMTP id c11so3171348wgh.22
	for <meta-ti@yoctoproject.org>; Sun, 28 Apr 2013 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:from:date:x-google-sender-auth
	:message-id:subject:to:content-type;
	bh=2LaDxdSkoodel8cf7U8Qhv28rvl/CV7womlj81BIjnU=;
	b=ZTkmWHcNySInfMspPz9r5raS/adz1Bp2W9bIN3u5+JevCoU7ArFcuDaNNkwAWBuNJK
	xa1rhyZ+jvmGrDvo+xiVRCP440zDL9b+b9nZHxXOI3NyQwfHBSMdU+MpEEB01G3zK3OP
	Dt9IK10s00ZBk70reDN48CM2LbRO0msIyxFi8f9W17gAopBExQFA9+vTogt0FGzL5aBO
	cgAzB4WtJnZNOV24X0FyBEiLY5cMvrm1wDfMoZRy+qxPMPnRLd1fH0mgzC0ylPpooebt
	I3n2N8cgRi2/byuXyUMCbbYghYRY5VDKoWxAASoMO+RKOtiti9TsvAagKOZRof03gfwl
	RrTA==
X-Received: by 10.194.219.162 with SMTP id pp2mr13204103wjc.27.1367171475449; 
	Sun, 28 Apr 2013 10:51:15 -0700 (PDT)
MIME-Version: 1.0
Sender: jon.szymaniak@gmail.com
Received: by 10.194.37.233 with HTTP; Sun, 28 Apr 2013 10:50:55 -0700 (PDT)
From: Jon Szymaniak <jon.szymaniak+gpg@gmail.com>
Date: Sun, 28 Apr 2013 13:50:55 -0400
X-Google-Sender-Auth: D5hmfzl5PmS8ErS4TZQwQ10Dl4g
Message-ID: <CANge7vXRw==LjwWsXUL_sP1v05BGaGUPbr9K8HG4By6nON7kKw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: linux-ti-staging fetcher failures
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
X-List-Received-Date: Sun, 28 Apr 2013 17:51:17 -0000
Content-Type: multipart/alternative; boundary=001a11c1b9a82430ac04db6f6a21

--001a11c1b9a82430ac04db6f6a21
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I just wanted to inquire about the status of git.ti.com, which the
linux-ti-staging_3.8.bb recipe clones from.

I've been trying to bring up my am335xevm, and have been constantly getting
timeouts from git.ti.com for the last few days.  I've had no luck manually
cloning the kernel from this server -- is this not publicly accessible?

Any thoughts?

Thanks!
Jon

--001a11c1b9a82430ac04db6f6a21
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div></div>Hi all,<br><br></div>I just want=
ed to inquire about the status of <a href=3D"http://git.ti.com">git.ti.com<=
/a>, which the <a href=3D"http://linux-ti-staging_3.8.bb">linux-ti-staging_=
3.8.bb</a> recipe clones from.<br>

<br></div>I&#39;ve been trying to bring up my am335xevm, and have been cons=
tantly getting timeouts from <a href=3D"http://git.ti.com">git.ti.com</a> f=
or the last few days.=A0 I&#39;ve had no luck manually cloning the kernel f=
rom this server -- is this not publicly accessible? <br>

</div><div><div><div><div><br></div><div>Any thoughts?<br></div><div><br>Th=
anks!<br>Jon<br></div></div></div></div></div>

--001a11c1b9a82430ac04db6f6a21--
