Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0A76E01473
	for <meta-ti@yoctoproject.org>; Mon, 21 Jan 2013 18:21:14 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0M2LEAM027297
	for <meta-ti@yoctoproject.org>; Mon, 21 Jan 2013 20:21:14 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0M2LEn3012256
	for <meta-ti@yoctoproject.org>; Mon, 21 Jan 2013 20:21:14 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 Jan 2013 20:21:13 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r0M2LDuu002583;
	Mon, 21 Jan 2013 20:21:13 -0600
Date: Mon, 21 Jan 2013 21:21:12 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130122022112.GJ15396@edge>
References: <8F29D6B095ED194EA1980491A5E029710C374AF1@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C374AF1@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Issue with multi-kernel.inc
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
X-List-Received-Date: Tue, 22 Jan 2013 02:21:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Jan 20, 2013 at 06:20:58PM +0000, Cooper Jr., Franklin wrote:
> I thought a simple solution would be to call do_configure at the end of 
> compileconfigs but then I get a series of
> "basename: missing operand"
> and
> make: *** No rule to make target `oldconfig`. Stop"

That's because it ends up being in deploy/ directory - try the patch I just 
sent, it worked for me.

-- 
Denys

