Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3FA5E00744; Thu,  4 Sep 2014 12:41:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77003E004F5
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 12:41:13 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84JfClV031654;
	Thu, 4 Sep 2014 14:41:12 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84JfC9s002060;
	Thu, 4 Sep 2014 14:41:12 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 14:41:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84JfBVX002514;
	Thu, 4 Sep 2014 14:41:12 -0500
Date: Thu, 4 Sep 2014 15:41:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
Message-ID: <20140904194111.GV18620@edge>
References: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
	<20140904150022.GD18620@edge> <54088734.1090204@pabigot.com>
	<20140904154819.GH18620@edge>
	<CAOCHtYgkaixBwP84Ocqa4y9H1_9__Y1BR-2UKGeiUXn0Bhk_+Q@mail.gmail.com>
	<20140904181056.GO18620@edge> <5408B7B4.9090504@pabigot.com>
	<CAOCHtYg5L55eyNUxiKSsh=NVObu1MfcAQdqC-VdMdcYWPmFc-Q@mail.gmail.com>
	<CAOCHtYiVQtyiGJMnoyvzTzDqKdx=RLeRx9UQZpmVsfJmeSqLJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOCHtYiVQtyiGJMnoyvzTzDqKdx=RLeRx9UQZpmVsfJmeSqLJw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: poor performance of OpenEmbedded on, BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 19:41:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 04, 2014 at 02:09:02PM -0500, Robert Nelson wrote:
> On Thu, Sep 4, 2014 at 2:07 PM, Robert Nelson <robertcnelson@gmail.com> wrote:
> >> Indeed, the A5C has a 962A chip which is Si 2.0, while the B has a 962B chip
> >> that is Si 2.1, per SPRZ360F.
> >
> > Found my "A4" don't think anything earlier went out
> >
> > 962: 1.0
> 
> This one was obviously binned, it's still running 1Gh, almost 2 years old..

I have A1 somewhere around here, but I don't think that was available outside 
of TI. It has an upside-down mSD card slot... I might be able to check if it 
does 1GHz. :)

-- 
Denys

