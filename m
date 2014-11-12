Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC2B2E00777; Wed, 12 Nov 2014 10:21:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 696D6E005B7
	for <meta-ti@yoctoproject.org>; Wed, 12 Nov 2014 10:21:47 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sACILctr028518;
	Wed, 12 Nov 2014 12:21:38 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sACILbeT021904;
	Wed, 12 Nov 2014 12:21:37 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 12 Nov 2014 12:21:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id sACILbHi018340;
	Wed, 12 Nov 2014 12:21:37 -0600
Date: Wed, 12 Nov 2014 13:21:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Cliff Brake <cbrake@bec-systems.com>
Message-ID: <20141112182136.GV25408@edge>
References: <CAOd_LFxoiKK-NjefTQwYcpTSu-JT3sTqm30jC2eYtaJ_n8=Dwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFxoiKK-NjefTQwYcpTSu-JT3sTqm30jC2eYtaJ_n8=Dwg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: QT5 on Overo
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
X-List-Received-Date: Wed, 12 Nov 2014 18:21:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 11, 2014 at 08:55:18AM -0500, Cliff Brake wrote:
> What is the path to getting QT5 working on an Overo (DM3730, etc).
> What kernel version/recipe is supported, etc.

You can try linux-ti-staging, as that one gets more attention and testing. It 
should support legacy devices like OMAP3. Or you can definitely try 
linux-mainline too. Then it depends what QPA you need - linuxfb has been 
working for long time, as well as gles, but we switched to wayland some time 
ago and I haven't tried others for some time now.

-- 
Denys

