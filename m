Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF203E00747
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 09:41:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KGfC5L003017
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 11:41:12 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KGfCkl026624
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 11:41:12 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 11:41:12 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7KGfBsU027350;
	Tue, 20 Aug 2013 11:41:12 -0500
Date: Tue, 20 Aug 2013 12:41:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Message-ID: <20130820164111.GC8481@edge>
References: <CF956B779D819D41BBC043B7082161D544493F@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <CF956B779D819D41BBC043B7082161D544493F@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Timeout issue
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
X-List-Received-Date: Tue, 20 Aug 2013 16:41:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 20, 2013 at 09:33:15AM +0000, Hingolikar, Mrinmayee wrote:
> Hi all,
> 
> During yocto build many times the fetch times out resulting in a fetcher 
> failure. The same command for fetch when run with a larger timeout for wget 
> succeeds.
> Where can we modify the arguments to wget so that the build doesn't halt due 
> to a fetcher failure?

Mrinmayee,

Please also raise this issue with the IT department from your side - we've 
seen the proxies timing out lately for other teams and the more people 
complain, the faster it should get resolved... Thanks.

-- 
Denys

