Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04FA8E01423
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 12:48:36 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAKKmYmo021415;
	Tue, 20 Nov 2012 14:48:34 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAKKmYGc027355;
	Tue, 20 Nov 2012 14:48:34 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 20 Nov 2012 14:48:33 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qAKKmXL5017808;
	Tue, 20 Nov 2012 14:48:33 -0600
Date: Tue, 20 Nov 2012 15:48:33 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20121120204833.GE26674@edge>
References: <alpine.DEB.2.02.1211201419330.18808@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1211201419330.18808@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: there *is* no libdrm_2.4.39 in oe-core anymore, it's now 2.4.40
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
X-List-Received-Date: Tue, 20 Nov 2012 20:48:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 20, 2012 at 02:20:51PM -0500, Robert P. J. Day wrote:
> 
>   only 5 days ago, oe-core upgraded libdrm to 2.4.40, so the recent
> meta-ti addition of libdrm_2.4.39.bbappend doesn't really do much
> good.

Yes, please pay attention - here's the parallel discussion from today:
http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1163

And the change in OE-Core master just happened yesterday:
http://cgit.openembedded.org/openembedded-core/commit/?id=8b100befe8dcf7523148b6fc14fa2237d07fe556

-- 
Denys

