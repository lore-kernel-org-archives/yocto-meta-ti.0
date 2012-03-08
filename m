Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 456E4E0030B
	for <meta-ti@yoctoproject.org>; Thu,  8 Mar 2012 08:17:57 -0800 (PST)
Received: by wibhq7 with SMTP id hq7so569269wib.35
	for <meta-ti@yoctoproject.org>; Thu, 08 Mar 2012 08:17:56 -0800 (PST)
Received: by 10.180.97.41 with SMTP id dx9mr9730302wib.9.1331223475919;
	Thu, 08 Mar 2012 08:17:55 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fb2sm45127278wid.3.2012.03.08.08.17.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 08:17:54 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330986374-5746-1-git-send-email-denis@denix.org>
Date: Thu, 8 Mar 2012 17:17:50 +0100
Message-Id: <F760AE2B-53D2-4E8E-AA58-274F71CFC988@dominion.thruhere.net>
References: <1330986374-5746-1-git-send-email-denis@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQm8rBbcCBOaafzpK2bi0bSC+STVOkO7/c36yVR8pJYgGaZrdfAcRxbldFSMnIeWWiUa7Inb
Cc: meta-ti@yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] linux-omap4 3.1.0: patch to workaround installing FW images w/o subdirs
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
X-List-Received-Date: Thu, 08 Mar 2012 16:17:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 mrt. 2012, om 23:26 heeft Denys Dmytriyenko het volgende =
geschreven:

> From: Denys Dmytriyenko <denys@ti.com>
>=20
> This fixes below error found on some distros (Gentoo and Fedora):
> *** No rule to make target `lib/firmware/./', needed by =
`lib/firmware/ti_3410.fw'.  Stop.

A bit late, but:

NOTE: package linux-omap4-3.1.0-r1a: task do_install: Started


regards,

Koen=

