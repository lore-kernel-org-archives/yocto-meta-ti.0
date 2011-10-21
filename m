Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37DE8E01341
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 01:40:17 -0700 (PDT)
Received: by eyh5 with SMTP id 5so4981365eyh.35
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 01:40:16 -0700 (PDT)
Received: by 10.213.31.69 with SMTP id x5mr3060464ebc.5.1319186416813;
	Fri, 21 Oct 2011 01:40:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 54sm315967eex.8.2011.10.21.01.40.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:40:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319176585-30116-1-git-send-email-denis@denix.org>
Date: Fri, 21 Oct 2011 10:40:14 +0200
Message-Id: <A0140960-115C-4F5C-A503-C869D08218A4@dominion.thruhere.net>
References: <1319176585-30116-1-git-send-email-denis@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot 2011.10rc: update to the latest revision
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
X-List-Received-Date: Fri, 21 Oct 2011 08:40:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 21 okt. 2011, om 07:56 heeft Denys Dmytriyenko het volgende geschreven:

> From: Denys Dmytriyenko <denys@ti.com>
> 
> Updated to latest version to pick up the following changes:
> * 9158d7f am335x: Really correct NAND partiton layout

That one broke a patch, but I massaged it to work again :)

