Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1A8DE006C4; Tue, 15 Jul 2014 11:41:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FFEDE004FF
	for <meta-ti@yoctoproject.org>; Tue, 15 Jul 2014 11:41:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6FIfNj0008462;
	Tue, 15 Jul 2014 13:41:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6FIfNhS012641;
	Tue, 15 Jul 2014 13:41:23 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 15 Jul 2014 13:41:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6FIfNPn013106;
	Tue, 15 Jul 2014 13:41:23 -0500
Date: Tue, 15 Jul 2014 14:41:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140715184122.GH15788@edge>
References: <53C3F353.2020001@gmail.com>
	<CAMKF1sqn0wYeNHps-0Ss0zotP3cMp-u2iVC1e49Cc8o3HO4OcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqn0wYeNHps-0Ss0zotP3cMp-u2iVC1e49Cc8o3HO4OcA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [daisy] missing network adapter options in omap2plus_defconfig
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
X-List-Received-Date: Tue, 15 Jul 2014 18:41:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jul 15, 2014 at 11:34:31AM -0700, Khem Raj wrote:
> On Mon, Jul 14, 2014 at 8:12 AM, Miroslav Keš <miroslav.kes@gmail.com> wrote:
> >
> > Neverthelles, the kernel config pulled by 
> > meta-ti/recipes-kernel/linux/linux-mainline/defconfig refers the 
> > omap2plus_defconfig which doesn't set the CONFIG_USB_EHCI_HCD option.
> 
> inform or send a patch to meta-ti

This is meta-ti mailing list already...

-- 
Denys

