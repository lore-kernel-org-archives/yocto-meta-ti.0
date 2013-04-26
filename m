Return-Path: <wmills@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 538F1E014E4
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2013 08:45:06 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3QFj3Un027793;
	Fri, 26 Apr 2013 10:45:03 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3QFj2QQ031333;
	Fri, 26 Apr 2013 10:45:02 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 26 Apr 2013 10:45:02 -0500
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.102.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r3QFj2K5007919;	Fri, 26 Apr 2013 10:45:02 -0500
Message-ID: <517AA0FE.4080005@ti.com>
Date: Fri, 26 Apr 2013 11:45:02 -0400
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Mats Liljegren <liljegren.mats2@gmail.com>
References: <CA+xJJ18wBM7G=Nt12yMX8KLmTZWS+SnBsXb3F4X1xgq=Y=0y0w@mail.gmail.com>
In-Reply-To: <CA+xJJ18wBM7G=Nt12yMX8KLmTZWS+SnBsXb3F4X1xgq=Y=0y0w@mail.gmail.com>
Cc: meta-ti <meta-ti@yoctoproject.org>, linux-omap <linux-omap@vger.kernel.org>
Subject: Re: Full nohz on TCI6638k2k (KeyStone II)
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
X-List-Received-Date: Fri, 26 Apr 2013 15:45:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/26/2013 03:06 AM, Mats Liljegren wrote:
> I would like to perform a customer demo running a benchmark
> application in full nohz mode on TCI6638k2k target, which as far as I
> understand it is a KeyStone II architecture.
>
> Does anyone know what the best Linux source code is to perform the
> nohz port for this board? It should preferably be Linux 3.9 of any RC
> level, but 3.8 should work as well.
>
> I also need a hardware timer to be used as an interrupt source for the
> interrupt latency measurements. Any suggestions for framework or
> driver to use?
>

Mats,

The team is just now rebasing the bringup work on 3.8.4.  You can find 
their work here:
http://arago-project.org/git/projects/?p=linux-keystone.git;a=shortlog;h=refs/heads/release-server/master

(The word "server" ~= 3.8 for this archive)

Please note that all the master branches are rebuilt from the feature 
branches in the nightly build script.  I think the feature branches get 
rebased also.  The tags of course you can count on.

The A15's use the per-core archetecture timer normally.  However the SOC 
has multiple (20) Timer64 peripherals that can be used as well if they 
are not being used by the DSPs.  If you configure which timer64 to use 
w/ device tree you should be fine.

Bill

