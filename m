Return-Path: <jfabernathy@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10A7EE0070C
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2012 03:50:57 -0800 (PST)
Received: by ghbz10 with SMTP id z10so2654734ghb.35
	for <meta-ti@yoctoproject.org>; Tue, 06 Mar 2012 03:50:57 -0800 (PST)
Received-SPF: pass (google.com: domain of jfabernathy@gmail.com designates
	10.236.161.103 as permitted sender) client-ip=10.236.161.103; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of jfabernathy@gmail.com
	designates 10.236.161.103 as permitted sender)
	smtp.mail=jfabernathy@gmail.com;
	dkim=pass header.i=jfabernathy@gmail.com
Received: from mr.google.com ([10.236.161.103])
	by 10.236.161.103 with SMTP id v67mr31958558yhk.65.1331034657595
	(num_hops = 1); Tue, 06 Mar 2012 03:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=fpbPiQYBEAcp937ACxl2THZSlOHDzhzj0StiKmLyMK8=;
	b=TD4VFOj92VWFUDkPepvv0g6rTdFBWqMGE9rVfUedD9oJ1WoVjV+OfOiuc6X8AEm1+f
	VgFVURYjzad53BUVr6Um1QSOYxzVrqTAiWd8icopkjlNSJ2GqQF8mD3JkvMwIgqkJDZR
	WCW5ipXqdykCVUi3NSLAh6A6wabrcgY0qblQng0U9mnXfsJhKmUE6pOJs4H/ztsmpNPo
	JJsn8hIDl0bZf3jVTDh4OrFQSV0ziETbgTpyYr18OXCW3w1eE2lQnvfc/9jqHUnKlwaP
	Yvkm5AuM/LBaHXaeFrGbK8ueMoTs+0+aNR2ghQ1S1QkCl+MjlrbXnP2ELd0tZ5IFOho1
	t9BQ==
Received: by 10.236.161.103 with SMTP id v67mr25277597yhk.65.1331034657538;
	Tue, 06 Mar 2012 03:50:57 -0800 (PST)
Received: from [10.80.119.91] ([166.137.13.68])
	by mx.google.com with ESMTPS id o6sm8771398ank.2.2012.03.06.03.50.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 03:50:57 -0800 (PST)
References: <4F553F17.8000602@gmail.com> <20120305225809.GE2030@denix.org>
	<4F557675.8010207@gmail.com> <4F55F62D.3030304@mlbassoc.com>
In-Reply-To: <4F55F62D.3030304@mlbassoc.com>
Mime-Version: 1.0 (1.0)
Message-Id: <FA0761AB-98AD-41B1-9947-4F31B13B8BE0@gmail.com>
X-Mailer: iPhone Mail (9A405)
From: Jim Abernathy <jfabernathy@gmail.com>
Date: Tue, 6 Mar 2012 06:50:51 -0500
To: Gary Thomas <gary@mlbassoc.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: building for OE pandaboard with angstrom
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
X-List-Received-Date: Tue, 06 Mar 2012 11:50:58 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Well I guess I didn't wait long enough. Apparently the first boot takes 15 =
minutes to completely boot to the login prompt.    I ignored the board and =
went back to email. And it got to a prompt eventually. I was expecting a GU=
I. After rebooting it came up to a GUI that looked like a gnome desktop. I =
still wonder about SD card differences and boot script for a Pandaboard vs.=
 Beagleboard.=20

Jim Abernathy
On Mar 6, 2012, at 6:34 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2012-03-05 19:29, jfabernathy wrote:
>> On 03/05/2012 05:58 PM, Denys Dmytriyenko wrote:
>>> On Mon, Mar 05, 2012 at 05:32:55PM -0500, jfabernathy wrote:
>>>> Since the README says that to get the complete features of the
>>>> pandaboard you need to follow the instructions at the angstrom link
>>>> provided, I tried that. The console-image builds and boots, but the
>>>> systemd-gnome-image fails on a do_fetch. Error message is below:
>>>>=20
>>>> | ERROR: Function failed: Fetcher failure for URL: 'ftp://ftp.debian.=
org/debian/pool/main/c/ca-certificates/ca-certificates_20111211.tar.gz'.
>>>> Checksum mismatch!
>>>> | File: '/home/jim/poky/setup-scripts/sources/downloads/ca-certificat=
es_20111211.tar.gz'
>>>> has md5 checksum 1047c5bb332e96cac982b2eaf76e84f7 when
>>>> f99a90a91b23338b4df765c0d18eba73 was expected
>>>> | File: '/home/jim/poky/setup-scripts/sources/downloads/ca-certificat=
es_20111211.tar.gz'
>>>> has sha256 checksum
>>>> 73b8d9f14bd08da79cb2bbb6e8ec3c4de23f2213a2c25fbe07b720dbfc852d73
>>>> when
>>>> 6f0633136d17ffef3ed0adfb171a00136a320f0fd79c9c75733ac02662a754a7 was
>>>> expected
>>>> NOTE: package ca-certificates-20111211-r0: task do_fetch: Failed
>>>> ERROR: Task 3064 (/home/jim/poky/setup-scripts/sources/meta-openembed=
ded/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb,
>>>> do_fetch) failed with exit code '1'
>>> The main debian server no longer hosts 20111211 version of ca-certific=
ates.
>>> The update to the current 20120212 version is currently pending in met=
a-oe:
>>>=20
>>> http://thread.gmane.org/gmane.comp.handhelds.openembedded/50963
>>>=20
>>> Meanwhile you can locate the correct version of the tarball and place =
it in
>>> your downloads/ directory...
>>>=20
>> I got the systemd-gnome-image to built this time, but the image does no=
t completely boot. I followed the instruction in poky/README.hardware for B=
eagleboard to create the SDcard. I
>> just took a chance that it would be close enough for Pandaboard. I'm gu=
essing there are some changes to the instructions for Pandaboard. If true, =
where are they located??
>=20
> What do you mean "does not completely boot?"
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------

