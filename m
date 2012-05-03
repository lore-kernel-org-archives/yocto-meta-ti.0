Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7099CE00723
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 00:26:53 -0700 (PDT)
Received: by werc12 with SMTP id c12so1256511wer.35
	for <meta-ti@yoctoproject.org>; Thu, 03 May 2012 00:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=zmS8SxR0/9TRj8KqAv42DucyT23wyodAGsqxba/Pi0M=;
	b=C2Uo9Pl7U19GbbBkS6h5rm6TwwZX3b+udst+lxkr8WM8CiSXrvUf4+QsN2lvurI4al
	JxLh8yHTkMjcqHD2scsdmnK77+FvNiLp6CaVsnqvRd+JPUXfneUeQe6WpoI0hkfOw9J4
	Up9iTNQBulPqfzTHrYHbfgjTy5i4+CvAcF3rimNwwZUyxzWwvr7nbOYHWtwD3Gvyn0N+
	6+T9kWLWflxTI36f+FueaaKavddYpC4/as7cs/G27shr5IHwTeOTBr3SMD6ABOQp4KX4
	mpbea7BaFfLgQU/lbIstphKXiVgqaQrT70xiimbMixtUCkgPpf295BmjjR4SK53HypXJ
	askQ==
Received: by 10.216.143.74 with SMTP id k52mr735580wej.50.1336030011903;
	Thu, 03 May 2012 00:26:51 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h8sm794667wix.4.2012.05.03.00.26.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 00:26:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336026806-13314-1-git-send-email-denis@denix.org>
Date: Thu, 3 May 2012 09:26:51 +0200
Message-Id: <73633949-8558-4D16-958F-3BCDB1165EA8@dominion.thruhere.net>
References: <1336026806-13314-1-git-send-email-denis@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmShfPYRT1JImfwLeSfJBbEG4k8M6RPbx+2crTDzsnmnZ2jjz05WC4+Zw9bsUl3lO6A5CYs
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] omap3-sgx-modules, libgles-omap3: add version 4.06.00.01
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
X-List-Received-Date: Thu, 03 May 2012 07:26:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2012, om 08:33 heeft Denys Dmytriyenko het volgende geschreven:

> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * Ported from Arago
> * Added version 4.06.00.01 of the Graphics SDK which supports Power =
Management
>  features for the AM335x
> * Use a variable PLATFORM for the directory structure since newer SDKs =
use
>  LinuxARMV7 and older SDKs use LinuxOMAP3
> * Modifiy rc.pvr to check return of the insmod of pvrsrvkm. If this =
driver
>  fails to load the devmem2 read access can put the system in a state =
where
>  it will not come out of suspend.

I keep bringing this up every few months: what's the plan to add the =
necessary hooks to the kernel module to export the core revision in =
sysfs instead of using devmem2? The kernel module knows about the right =
memory addressed and turns on the clocks it needs. And better: we can =
get rid of bogus ES revisions like 'ES8' since that's exactly the same =
core as 'ES6' from a userspace point of view.

regards,

Koen=

