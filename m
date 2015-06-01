Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A594E00A70; Mon,  1 Jun 2015 08:55:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91ACBE00945
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 08:55:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51FteFH012775;
	Mon, 1 Jun 2015 10:55:40 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51FteHv004678;
	Mon, 1 Jun 2015 10:55:40 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 10:55:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51FtdcW013903;
	Mon, 1 Jun 2015 10:55:40 -0500
Date: Mon, 1 Jun 2015 11:55:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Rafael E. Herrera" <raffo@cdi.com>
Message-ID: <20150601155539.GP16418@edge>
References: <302450063.1067976.1432670067718.JavaMail.root@cdi.com>
	<1915412900.1068078.1432671088243.JavaMail.root@cdi.com>
MIME-Version: 1.0
In-Reply-To: <1915412900.1068078.1432671088243.JavaMail.root@cdi.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Help getting started developing.
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
X-List-Received-Date: Mon, 01 Jun 2015 15:55:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

BitBake operates on recipes and those are just basic instructions to how 
fetch, patch, config, compile, install and package components. In many cases 
it just drives the standard compilation procedure w/o doing anything extra. 
I.e. it calls ./configure script, calls make and then make install for config, 
compile and install steps. If you get your component from the Internet, then 
all you have to do is specify the URL and it will fetch and unpack everything 
for you. Patching is optional in most cases, unless you need to apply fixes. 
And if you use one of OE/Yocto distros, packaging should also be taken care 
for you.

There are some recipe examples, stubs/skeletons and a lot of documentation on 
BitBake, OpenEmbedded, etc. There are also some helpful tools that Yocto 
Project provides to jump start your development. Hope this helps.

-- 
Denys


On Tue, May 26, 2015 at 04:11:28PM -0400, Rafael E. Herrera wrote:
> Hello, 
> I have purchased a TI UEVM5432 board. I have also successfully setup the 
> development environment as described on the online documentation from the TI 
> web site 
> (http://processors.wiki.ti.com/index.php/OMAP5_GLSDK_Software_Developers_Guide). 
> My developement environment is the recommended Ubuntu distribution.
> 
> I have also successfully build the Yocto filesystem (as per the instructions 
> in the link above) and successfully booted the generated image in the 
> evaluation board.
> 
> Where I need help is on how to port an application to the Yocto filesystem.  
> In particular, I need to build an X Window client.
> 
> The instructions in the link above don't explain well how to 
> prepare/configure my environment so I can compile my application.
> 
> If it were a typical development environment, I would configure my Makefiles 
> and just compile. The method used with this development environment 
> (bitbake) is not that clear to me.
> 
> Any help would be greatly appreciated.
> 
> 
> Rafael Herrera 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

