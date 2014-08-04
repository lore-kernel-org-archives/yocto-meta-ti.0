Return-Path: <tom.rini@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72115E004DD; Mon,  4 Aug 2014 09:39:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.44 listed in list.dnswl.org]
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 357D2E0030B
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 09:39:01 -0700 (PDT)
Received: by mail-qg0-f44.google.com with SMTP id e89so9146786qgf.17
	for <meta-ti@yoctoproject.org>; Mon, 04 Aug 2014 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=6J3sWyvz4ZRZJCkdvPLBB8V8bq50nkUR695+dmJIxLc=;
	b=FRDDdSdqBS8kJ7DrFF/GqiPLhR49nHcPvPdOCEmbjyH8VU72vtNOKAa77GGPJGllRz
	faFbe65Ujli+FoIXbUnwKmJyS8914lS0irb4egcQzM9+SMyuzd5NZAtpLxPialsZu3tR
	4OLiztUA8ZJni53Rf/Rpr5rtuEmzWfKL9nrq2d/OJDq6UY0ZCP6oFHre6xehBrwRg/xg
	h+cySiAswxmK1ZFDFzAFoteecaxH4bUgoNxIXVT1HyntC6Bl0mpgp2q9KGRZOl1aIECq
	pKO5Gr3Pkx6+BqPvHVDgCJYdM0iqzXi5NfmAjrbpcqHnIB/JeSxSwQjvKd++pRw5d7jS
	aeaQ==
X-Received: by 10.224.127.131 with SMTP id g3mr38617143qas.0.1407170341008;
	Mon, 04 Aug 2014 09:39:01 -0700 (PDT)
Received: from bill-the-cat (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id t3sm32142245qak.18.2014.08.04.09.38.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 09:38:57 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Mon, 4 Aug 2014 12:38:55 -0400
From: Tom Rini <trini@ti.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20140804163855.GK19374@bill-the-cat>
References: <1407167150-22655-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1407167150-22655-1-git-send-email-alexandre.belloni@free-electrons.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone: use the am335x_boneblack u-boot configuration
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
X-List-Received-Date: Mon, 04 Aug 2014 16:39:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 04, 2014 at 05:45:50PM +0200, Alexandre Belloni wrote:

> Using the am335x_boneblack configuration for u-boot allows to save the
> environment to the emmc. Else, it is not possible to save the
> environment at all.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

There's two ways to go about improving the out of box experience.  One
of which would be to switch "beaglebone" to am335x_boneblack config
which will switch env saving to eMMC and leave BBW just as unable to
have persisent env (outside of uEnv.txt) as today.  Another would be to
bring in http://patchwork.ozlabs.org/patch/375824/ (which will be merged
to mainline) and
https://git.ti.com/ti-u-boot/ti-u-boot/commit/b8fce957880e6c4194614260f70be4e7f2c9f469
(which will not, we'll instead get env location migrated to Kconfig
choices and leave it to the user to pick where they want things to be)
which puts everything in a binary file on the FAT partition of the SD
card which is also pretty frequently available.

Either one is honestly a fine improvement.

-- 
Tom

