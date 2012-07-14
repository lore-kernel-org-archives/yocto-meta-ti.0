Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D18CE0027E
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2012 23:50:18 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6E6oHgG027645;
	Sat, 14 Jul 2012 01:50:17 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6E6oHL6000538;
	Sat, 14 Jul 2012 01:50:17 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 14 Jul 2012 01:50:17 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6E6oGCg020743;
	Sat, 14 Jul 2012 01:50:16 -0500
Date: Sat, 14 Jul 2012 02:50:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120714065015.GC24097@edge>
References: <CADZ6=avGWT=-4vLVs3VOW6dx1kmuo_qyP7jdkQiroM-UXZi06A@mail.gmail.com>
	<20120713233018.GA24499@edge>
	<AAC1DFB5-A2AB-49F2-A802-7DBF124F4E08@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <AAC1DFB5-A2AB-49F2-A802-7DBF124F4E08@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: netbase-4.47 vs. -5.0 build breakage
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
X-List-Received-Date: Sat, 14 Jul 2012 06:50:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Jul 14, 2012 at 08:32:09AM +0200, Koen Kooi wrote:
> 
> Op 14 jul. 2012, om 01:30 heeft Denys Dmytriyenko het volgende geschreven:
> 
> > On Fri, Jul 13, 2012 at 04:47:22PM +0200, Thilo Fromm wrote:
> >> Hi guys,
> >> 
> >> is anything happening to fix the current build breakage against
> >> oe-core? oe-core moved on to netbase-5.0, meta-texasinstruments is
> >> still referring to netbase-4.47 with a .bbappend. Andreas M??ller
> >> submitted a patch on 9th of July which fixes this. Please apply the
> >> patch; currently the meta-ti build is broken.
> > 
> > Thilo,
> > 
> > People do have vacations, you know, hence the 4-day delay. It is now in.
> 
> Now that master is broken with denzil, can we have a branch to track yocto 
> 1.2/denzil please?

Yes, I was going to branch off of
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tag/?id=v2012.05-yocto1.2

-- 
Denys

