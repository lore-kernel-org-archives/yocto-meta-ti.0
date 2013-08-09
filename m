Return-Path: <bmentink@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49D5DE01480
	for <meta-ti@yoctoproject.org>; Fri,  9 Aug 2013 01:36:25 -0700 (PDT)
Received: by mail-pd0-f181.google.com with SMTP id g10so298374pdj.12
	for <meta-ti@yoctoproject.org>; Fri, 09 Aug 2013 01:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=FXW1NKzF5HocP1Rsvb6+jiZAZfrVVK96XVp1dfAvqkw=;
	b=pxAhfeIo2Ldzmx+tifJ8PBKhZsTw39/GVPMyRgtE7IkU/y51dLftRSsznNKN84jiHy
	+6IQxsSGtq643A6Al27Xq2ZP/zEMbYLUUSIN8LYJUzpkwZ3hGlnX/CNyst4fAEWrfMRg
	EXnmjexsByzE1pzzncyL9stWg63NXN57W8d69KWzLXlNTcj+PJZCCTRS2FIaT0DMYTU4
	WiiZcaOR6SZ31n/2oHWRoafkKb3h+IaFESCujFQcii+zWxC630bJ5FwvyPTabAlGOXxh
	N8F6Ar7RK6s+cu44c2uGD2ZQfustD27YMRQtMy9J4hLeLBNR3fkTC2fH8WIsICosjbCN
	1WXQ==
MIME-Version: 1.0
X-Received: by 10.66.136.131 with SMTP id qa3mr10342995pab.77.1376037384973;
	Fri, 09 Aug 2013 01:36:24 -0700 (PDT)
Received: by 10.70.23.225 with HTTP; Fri, 9 Aug 2013 01:36:24 -0700 (PDT)
Date: Fri, 9 Aug 2013 20:36:24 +1200
Message-ID: <CALEed8ZHVy_e2z6aVBRRj2HkwZ8gfOAEs_Rf-KYfTopn20d5Eg@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Beaglebone black not booting
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
X-List-Received-Date: Fri, 09 Aug 2013 08:36:28 -0000
Content-Type: multipart/alternative; boundary=001a113376908771ab04e37fab7d

--001a113376908771ab04e37fab7d
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I am trying to get a Yocto + meta-ti build going for the beaglebone black,
but it only gets partway through the kernel boot, then fails with errors
relating to pin setup on MMC.

Is there a special target for the beaglebone black, I built using
MACHINE=beaglebone

I am building the minimal image.

Thanks,
Bernie

--001a113376908771ab04e37fab7d
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr">Hi All,<div><br></div><div>I am trying to get a Yocto + meta-ti build going for the beaglebone black, but it only gets partway through the kernel boot, then fails with errors relating to pin setup on MMC.</div>
<div><br></div><div>Is there a special target for the beaglebone black, I built using MACHINE=beaglebone</div><div><br></div><div>I am building the minimal image.</div><div><br></div><div>Thanks,</div><div>Bernie</div></div>

--001a113376908771ab04e37fab7d--
