Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5753E00B45; Mon,  5 May 2014 07:48:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3D20E00A44
	for <meta-ti@yoctoproject.org>; Mon,  5 May 2014 07:48:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s45ElxCG016466;
	Mon, 5 May 2014 09:47:59 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s45Elx7F010243;
	Mon, 5 May 2014 09:47:59 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 5 May 2014 09:47:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s45ElwbN002719;
	Mon, 5 May 2014 09:47:59 -0500
Date: Mon, 5 May 2014 10:47:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Julian =?iso-8859-1?Q?L=F6chner?= <Julian.Loechner@bmw-carit.de>
Message-ID: <20140505144758.GJ18053@edge>
References: <CF2FE2B57CC89348987E8C49193F18F62A97C633@Exchange2010.bmw-carit.intra>
	<20140505135413.GH18053@edge>
	<CF2FE2B57CC89348987E8C49193F18F62A981162@Exchange2010.bmw-carit.intra>
MIME-Version: 1.0
In-Reply-To: <CF2FE2B57CC89348987E8C49193F18F62A981162@Exchange2010.bmw-carit.intra>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Beaglebone ARM with linux-mainline_3.14 and RT_PREEMPT
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
X-List-Received-Date: Mon, 05 May 2014 14:48:11 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 05, 2014 at 02:38:38PM +0000, Julian Löchner wrote:
> I'm talking about this board: http://beagleboard.org/Products/BeagleBone 

Right, that's BeagleBone White, or the Original BeagleBone, before BeagleBone 
Black came out. Both use the same exact kernel, slightly different DTBs...


> -----Ursprüngliche Nachricht-----
> Von: Denys Dmytriyenko [mailto:denys@ti.com] 
> Gesendet: Montag, 5. Mai 2014 15:54
> An: Julian Löchner
> Cc: meta-ti@yoctoproject.org
> Betreff: Re: [meta-ti] Beaglebone ARM with linux-mainline_3.14 and RT_PREEMPT
> 
> On Mon, Apr 28, 2014 at 08:33:13AM +0000, Julian Löchner wrote:
> > Hello,
> > 
> > 
> > 
> > before I order a Beaglebone ARM (not the new Black edition),
> 
> Can you please clarify what you mean by Beaglebone ARM not the new Black edition?
> 
> 
> > I wanted to ask you, if it will run with the kernel linux-mainline_3.14 
> > and the RT_PREEMPT patch? Does anybody have experience with this setup?
> 
> I personally haven't tried it myself, but would be interested to find out too.
> 
> 
> > Cheers,
> > 
> > Julian
> > 
> > BMW Car IT GmbH
> 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> 

