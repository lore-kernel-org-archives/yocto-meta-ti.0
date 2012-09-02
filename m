Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8E8DE0049D
	for <meta-ti@yoctoproject.org>; Sun,  2 Sep 2012 09:16:50 -0700 (PDT)
Received: by wgx1 with SMTP id 1so2725248wgx.11
	for <meta-ti@yoctoproject.org>; Sun, 02 Sep 2012 09:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=4MsV7b6FhOYpZTAtJTMg0MtygeQtuynTH+BEek521Rs=;
	b=GNQZU6ccohddG28uQedRVWZGq7kK312YgalBYrsIFjU8/wujCodg6Ol4tksBd4Ip77
	FChHC/HEh+0m6YeJPFvkp+/B+p010JkjN1UwDIih0GzhGpe28DZDmCG/dGx6Qp91sbr/
	8d/DbwnsNxL76C73Y6w3xDaAGoAEtukc5ztT9K0/rfM9Un9vD8DOU//6lY0DL0CaPXlZ
	WXWH/b8rUMmT0oMVXt5LcCCgjPbVtua1oUWoXcXjzb4Tgl+lSJQjsif8OAFV76ZCHphL
	E4rp+UDfV3Q//L7TrcU5JBAy0sGcG3x+HeEvP2FwaVS/QL5N+EJKr7MTY1bdoNRAs/k2
	UMMQ==
Received: by 10.180.74.133 with SMTP id t5mr17453474wiv.2.1346602609198;
	Sun, 02 Sep 2012 09:16:49 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id k2sm20558550wiz.7.2012.09.02.09.16.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Sep 2012 09:16:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120901225617.GF22219@edge>
Date: Sun, 2 Sep 2012 18:16:46 +0200
Message-Id: <B2475CE6-3C80-4BE1-BCE9-A368D5F7B7C5@dominion.thruhere.net>
References: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
	<kkitbg3uuuda8t5puice0pub.1346534080222@email.android.com>
	<20120901225617.GF22219@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQn5sB4NLk2u9HsvuWJsSMAyWxsaFItWlwNfCJzSToPmrFUiX/EZBwa6CoOl4Q4eAzzCM5HC
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Fix image recipes in meta-ti
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
X-List-Received-Date: Sun, 02 Sep 2012 16:16:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 sep. 2012, om 00:56 heeft Denys Dmytriyenko <denys@ti.com> het =
volgende geschreven:

> On Sat, Sep 01, 2012 at 09:14:43PM +0000, Kridner, Jason wrote:
>> Will meta-oe take the recipes?
>=20
> Well, those maybe better suited for meta-angstrom instead... If you =
think=20
> about it - cloud9 is an important component of default Beaglebone =
images based=20
> on Angstrom, so images with the cloud9 in the name are naturally =
associated=20
> with Angstrom. Anybody else who'd like to use meta-ti as BSP layer =
outside of=20
> Angstrom would most probably use own images anyway...

I'd be happy to remove all those pesky beagleboard, beaglebone, =
pandaboard, etc related recipes, machines, images from meta-ti if they =
are causing such big, unsolvable problems for the TI SDK team.=20=

