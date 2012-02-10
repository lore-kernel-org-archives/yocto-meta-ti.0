Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C988E003E1
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 06:08:03 -0800 (PST)
Received: by werf1 with SMTP id f1so2629827wer.35
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 06:08:02 -0800 (PST)
Received: by 10.216.89.130 with SMTP id c2mr831274wef.55.1328882882228;
	Fri, 10 Feb 2012 06:08:02 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm18336035wib.0.2012.02.10.06.08.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 06:08:01 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 10 Feb 2012 15:08:03 +0100
Message-Id: <9A3E20AC-1D66-4B5E-8B91-B930DE69039B@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Mime-Version: 1.0 (Apple Message framework v1251.1)
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQkp3kcYyuNhG0YtaKbf614N2BOkduawWg07+Z4MTqQUxrJzbaJmX1qbInRP35LPPvCv53k3
Subject: Merging in linux-stable updates, git send-email
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
X-List-Received-Date: Fri, 10 Feb 2012 14:08:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

The update to 3.2.5 for the bone kernel is almost done, but it involves =
adding ~275 patches. Does it make sense to git-send-email that megapatch =
for review? The difficulty is rooted in the origin of the TI kernel: =
linux-omap instead of Linus' tree, so we can't (easily) rebase all the =
patches on top of 3.2.5, so it's actually 3.2.5 rebased onto TI =
v3.2-staging and then the extra beaglebone patches added.

Git am -3 takes care of duplicate patches and automerging conflicts but =
I'd still like to find out what the best way to review this is.

regards,

Koen=

