Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30DCAE014A5
	for <meta-ti@yoctoproject.org>; Mon,  3 Jun 2013 11:55:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r53It3WP006010
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 13:55:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r53It3Tv010908
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 13:55:03 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 3 Jun 2013 13:55:03 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r53It3JM007084;
	Mon, 3 Jun 2013 13:55:03 -0500
Date: Mon, 3 Jun 2013 14:55:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130603185502.GD10512@edge>
References: <A4887BF146CD57468F700B415D2F470159EF7A@DBDE04.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C492418@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C492418@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Meta-TI patches for OMAPL138
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
X-List-Received-Date: Mon, 03 Jun 2013 18:55:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 03, 2013 at 06:44:59PM +0000, Cooper Jr., Franklin wrote:
> If you plan on adding support for an omapl138 soc/board then please do not 
> make changes to am18x recipes and machine.

Well, am18x board does use omapl138 SOC...


> A new machine should be created for this new machine.

??? I know you meant config, but this is just funny :)


> I would take the conf/machine/am180x-evm.conf and duplicate it for your 
> ompal138 board and make the necessary changes there.

And I, before giving any specific recommendations, would like to understand 
how and where these patches fit - what exact machine/platform is this for and 
what is the product SDK this goes into? What will be the support model for 
that?

It does seem to conflict with Sitara AMSDK (am180x-evm based on OMAPL138 SOC) 
that still uses 2.6.37 kernel. Once I know a little bit more about this new 
PSP release 03.22.00.04 for of 3.3 kernel, I'd be able to give better 
recommendations on how to properly integrate your work into meta-ti layer.

Thanks.

-- 
Denys



> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Vishwanathrao Badarkhe, Manish
> Sent: Monday, June 03, 2013 1:02 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] Meta-TI patches for OMAPL138
> 
> Hi
> Please find attached patches for OMAPL138 recipe for release 03.22.00.04.
> Please review these patches.
> These patches are based on http://arago-project.org/git/?p=meta-ti.git;a=summary repository.
> 
> Thanks and Regards
> Manish Badarkhe

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


