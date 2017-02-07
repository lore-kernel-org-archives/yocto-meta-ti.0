Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50D3DE008D0; Tue,  7 Feb 2017 09:39:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8207E00655
	for <meta-ti@yoctoproject.org>; Tue,  7 Feb 2017 09:39:44 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v17Hdexo031070;
	Tue, 7 Feb 2017 11:39:40 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v17Hde4c011642;
	Tue, 7 Feb 2017 11:39:40 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 11:39:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v17Hdd8M015916;
	Tue, 7 Feb 2017 11:39:39 -0600
Date: Tue, 7 Feb 2017 12:39:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: deepak vijay <deepakvijay2255@rediff.com>
Message-ID: <20170207173938.GR25590@edge>
References: <CAAxuRXj5GHofLCuYT118HcWixo5P4KeEtvUCdJdmXLD6qzQkng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAxuRXj5GHofLCuYT118HcWixo5P4KeEtvUCdJdmXLD6qzQkng@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: How to add a new machine in meta-ti and configure ti-cgt toolchain to it?
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
X-List-Received-Date: Tue, 07 Feb 2017 17:39:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 07, 2017 at 12:59:48PM +0530, deepak vijay wrote:
> Hi,
> 
> I am new to Yocto. I am trying to add a new machine omapl13x to mata-ti
> layer and i need to use ti-arm-cgt toolchain for this machine. But I am
> getting error for do_compile showing that "/bin/armcl command not found" .
> 
> Can you guys please help me to understand where to define the toolchain
> path for a particular machine?
> I already tried with EXTERNAL_TOOLCHAIN in conf file but it was not
> working.

Please see meta-arago distro layer for all the setup and configuration needs.

-- 
Denys

