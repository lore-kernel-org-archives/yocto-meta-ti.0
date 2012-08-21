Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE97FE00346
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2012 12:54:05 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7LJs1Au025364;
	Tue, 21 Aug 2012 14:54:01 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7LJs00H010899;
	Tue, 21 Aug 2012 14:54:01 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 21 Aug 2012 14:54:01 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7LJs0d7003452;
	Tue, 21 Aug 2012 14:54:01 -0500
Date: Tue, 21 Aug 2012 15:54:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120821195359.GC7636@edge>
References: <1345535127.49985.YahooMailNeo@web121206.mail.ne1.yahoo.com>
	<20120821180942.GB7636@edge>
	<CAMKF1sqpM+wVj_EGAqojAUbknH_WnBb4L9nZh3-fH2uDhEx4RA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqpM+wVj_EGAqojAUbknH_WnBb4L9nZh3-fH2uDhEx4RA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Linaro and CS ABI compatibility
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
X-List-Received-Date: Tue, 21 Aug 2012 19:54:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 21, 2012 at 11:39:07AM -0700, Khem Raj wrote:
> On Tue, Aug 21, 2012 at 11:09 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > BTW, Yocto Project prefers self-built toolchain, although you can easily add
> > Linaro toolchain with meta-linaro layer.
> 
> There are no ABI differences even though its built separately.

Linaro's external (i.e. pre-built) toolchain now defaults to hardfp, so still 
need to pay attention to possible ABI mismatch...

-- 
Denys

