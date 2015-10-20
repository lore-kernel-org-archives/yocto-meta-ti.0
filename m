Return-Path: <paul.barker.commagility@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E9B1E00843; Tue, 20 Oct 2015 09:54:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.212.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B87E1E006D5
	for <meta-ti@yoctoproject.org>; Tue, 20 Oct 2015 09:54:51 -0700 (PDT)
Received: by wicll6 with SMTP id ll6so54768183wic.0
	for <meta-ti@yoctoproject.org>; Tue, 20 Oct 2015 09:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-type:content-transfer-encoding;
	bh=Mp52TaGSlfQLEExgqqgN5d2S3C0NYju2akBA/wHAzRE=;
	b=RNFeukZjN2ScqSNBHeNcMR95nDqDQn5fhp6h6CHDOuPJhYaaeAZdgsagEhm1KU4OkJ
	SPMWILg1UL5WUJ6PDRzmCF7b+Vuy//FunLo3olUzFr586X9GsKyVn/EzAQcJnveZyCLX
	w9Ptq48EAwOkh9SRdUcVImtcNVyFMJPIYad4HzZ4eusZ5IFdgVAcZ+fEim8R4QuOlCof
	nHlvUKRxk6m7MWlxidkuP0t6W6d7+dX9k0Fc2mXqKJTC0T4Tbvy9DZhuVlNsqsJ8cSAn
	cvPVPh8TlsOiLUdM7pNXUkDleyGQ86lfxsPB37IXm6/I5SMfSC1tNpab8DGwbkiGNhW3
	hqRg==
X-Received: by 10.180.23.9 with SMTP id i9mr3810707wif.51.1445360090494;
	Tue, 20 Oct 2015 09:54:50 -0700 (PDT)
Received: from centos-7 (inno-commagility-ownrouter.lut.ac.uk. [131.231.60.35])
	by smtp.gmail.com with ESMTPSA id
	cv1sm20096179wib.18.2015.10.20.09.54.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Oct 2015 09:54:49 -0700 (PDT)
Date: Tue, 20 Oct 2015 17:54:41 +0100
From: Paul Barker <paul.barker@commagility.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20151020175441.2adca0cc@centos-7>
In-Reply-To: <20151019222843.GL5620@edge>
References: <20151013190042.GA8031@bang.betafive.co.uk>
	<20151019222843.GL5620@edge>
Organization: CommAgility Ltd
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: linux-ti-staging: Error during parsing
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
X-List-Received-Date: Tue, 20 Oct 2015 16:54:55 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Oct 2015 18:28:43 -0400
Denys Dmytriyenko <denys@ti.com> wrote:

> On Tue, Oct 13, 2015 at 08:00:42PM +0100, Paul Barker wrote:
> > Hi,
> > 
> > I'm trying to move from dylan forward to fido and ran into a parsing error with
> > the linux-ti-staging recipe (all versions in the tree). Here's a run through of
> > what I've done on a Centos 7 host with relevant output included. I'm using the
> > coresdk-2015.01 tag but there aren't any commits on the fido branch after this.
> > 
> > $ git clone http://arago-project.org/git/projects/oe-layersetup.git
> > 
> > $ cd oe-layersetup/
> > 
> > $ ./oe-layertool-setup.sh -f configs/coresdk/coresdk-2015.01-config.txt
> > 
> > $ cd build/
> > 
> > $ . conf/setenv
> > 
> > $ MACHINE=k2hk-evm bitbake core-image-minimal
> > NOTE: Started PRServer with DBfile: /home/COMMAGILITY/paul.barker/tmp/oe-layersetup/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 37851, PID: 8637
> > NOTE: Your conf/bblayers.conf has been automatically updated.
> > ERROR: ExpansionError during parsing /home/COMMAGILITY/paul.barker/tmp/oe-layersetup/sources/meta-ti/recipes-kernel/linux/linux-ti-staging_4.1.bb: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception Fet
> > chError: Fetcher failure: The SRCREV_FORMAT variable must be set when multiple SCMs are used.
> 
> Hi, Paul,
> 
> Quick question - what do you use for a toolchain? By default, coresdk config 
> you reference above expects pre-built Linaro toolchain (tested with 2015.05) 
> in your PATH. While it is supposed to give a meaningful error message when it 
> can't find the expected toolchain, sometimes I've seen it fail and give 
> absolutely cryptic one instead. Can you please grab the following tarball, 
> extract it and add it's bin/ dir to your PATH and try again? Thanks.
> 
> http://releases.linaro.org/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz
> 
> BTW, meta-arago allows you to control the toolchain with TOOLCHAIN_TYPE and 
> TOOLCHAIN_BRAND variables, defaulting to "external" and "linaro"...
> 

Denys,

I was using the 15.02-3 release of the Linaro toolchain. I upgraded to 15.05
and tried again but saw the same error.

Using 'bitbake -e' I've confirmed that TOOLCHAIN_TYPE="external" and
TOOLCHAIN_BRAND="linaro".

Thanks,

-- 
Paul Barker
CommAgility Ltd

