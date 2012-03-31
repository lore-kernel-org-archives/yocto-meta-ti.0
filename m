Return-Path: <koen@dominion.thruhere.net>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D03A6E00596
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 20:02:32 -0700 (PDT)
Received: by pbbjt11 with SMTP id jt11so3074808pbb.35
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 20:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=lZx47WX5oCyVyUWUzcNErj5cm8brr0FHL7D0fzTELmg=;
	b=YlMnFRlzvNW4wRcG+gcvBohprC0J2AR0JZ+7B1U98oY7SyQcoKKKfH76b3S1zmmkan
	M4TgK0YzcbMK31K2TK3rt0R/G7j5P0CxYomBVnlxbWu6I4SYsWe72ft4MnrxyVIkft9k
	Wu7JI0/d0jX5OrMB7F5v8Dn9gZGAGeNmDx/eC3zSOfM+MLT9WGhdyjIjN3JSLjG47XZH
	eoFDpAw9ryTtyoAuzb2M/wWHw1Qg28AM2qm3IHAu0d9q7+Rd8nfnjxtfywJARaMjG0Ce
	N/yNGEVP+8hiycuDFbOH07HQveE/yrtKhEWtbHsr977+T6/g1SVeR0sVlszPK5i1lrCa
	FOuQ==
Received: by 10.68.233.135 with SMTP id tw7mr2026372pbc.152.1333162952596;
	Fri, 30 Mar 2012 20:02:32 -0700 (PDT)
Received: from [10.61.32.129] ([69.38.219.78])
	by mx.google.com with ESMTPS id i6sm8688215pbe.18.2012.03.30.20.02.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 20:02:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1333159463-19937-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 30 Mar 2012 20:02:30 -0700
Message-Id: <C51A3D6C-C990-4413-B7CE-2AD68F9D4CA4@dominion.thruhere.net>
References: <1333159463-19937-1-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmgOA5q79GohLco5VxA9I9pauYhqLDhPe2eJz6ypZrVZFRDJy8PpcxO+Rj7jQdiwrFhK96d
Subject: Re: [RFC][PATCH] u-boot 2011.10rc: add patch to speed up ext2load
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
X-List-Received-Date: Sat, 31 Mar 2012 03:02:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 mrt. 2012, om 19:04 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>=20
> Please test this patch on your am335x boards, I need to run out and =
buy a mini usb cable because I misplaced mine during traveling this =
week.=20

With the following in uEnv.txt:

uenvcmd=3Dmmc rescan ; setenv mmc_dev 0:1 ; echo starting fatload ; run =
mmc_load_uimage ; setenv mmc_dev mmc 0:2; echo starting ext2load ; run =
mmc_load_uimage_ext2

First run:

0.40	   0	Running uenvcmd ...
0.46	   6	starting fatload
0.48	   1	reading uImage
0.70	  22=09
0.70	   0	3140296 bytes read
0.70	   0	starting ext2load
0.72	   1	Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
0.78	   6	3140296 bytes read

Second run:

0.85	   0	Running uenvcmd ...
0.91	   6	starting fatload
0.91	   0	reading uImage
1.15	  23=09
1.15	   0	3140296 bytes read
1.15	   0	starting ext2load
1.15	   0	Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
1.21	   6	3140296 bytes read

Strangely enough ext2load seems to be faster now. More testing needed :)

regards,

Koen=

