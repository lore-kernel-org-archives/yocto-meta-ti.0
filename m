Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EB28E00715
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 10:03:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r83H3wKP031024;
	Tue, 3 Sep 2013 12:03:58 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83H3wAc018136;
	Tue, 3 Sep 2013 12:03:58 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 3 Sep 2013 12:03:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83H3v3f007827;
	Tue, 3 Sep 2013 12:03:57 -0500
Date: Tue, 3 Sep 2013 13:03:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Message-ID: <20130903170356.GC22235@edge>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
	<1378005180-30928-5-git-send-email-denis@denix.org>
	<20130901031528.GA18322@edge> <52247F4E.6030404@gmail.com>
MIME-Version: 1.0
In-Reply-To: <52247F4E.6030404@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remove old 4.03.00.02 version
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
X-List-Received-Date: Tue, 03 Sep 2013 17:04:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 02, 2013 at 02:06:38PM +0200, Tasslehoff Kjappfot wrote:
> On 09/01/2013 05:15 AM, Denys Dmytriyenko wrote:
> >BTW, consider this an RFC for removing the next 4.05.00.03 version as well - I
> >know some people are still using it, so please speak up.
> >
> 
> We're using 4.05.00.03 for our OMAP3530 board, because that is the
> latest one we've tried that actually works :)
> 
> Last time I tried newer versions there were "instant lockup"
> problems. Are any of the newer versions compatible with OMAP3530
> now?

Tasslehoff,

I don't think the support for OMAP3530 was specifically removed from latest 
versions, although I'm not sure if it got broken by accident though. Prabu?

-- 
Denys

