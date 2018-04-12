Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B409E00B8A; Thu, 12 Apr 2018 11:04:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jpewhacker[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54F7DE00848
	for <meta-ti@yoctoproject.org>; Thu, 12 Apr 2018 11:04:34 -0700 (PDT)
Received: by mail-it0-f54.google.com with SMTP id u62-v6so8149539ita.5
	for <meta-ti@yoctoproject.org>; Thu, 12 Apr 2018 11:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qHMQQFJ8ef4xp5s3qPv5DoTzcScdvyLUOuW6mWIyKPU=;
	b=bH3xY4A0Ioewep8da6NrzgAqrjU+lQC0GtchhplGX9rmaOKcAbKc6FG0oGw7YvsSRl
	KDTVc2qRkE6AY5lED4bTY6ATmxLvjzO2+1STGkHMACKPqFGs8miIP2fGR7X/9Nx1Z/fd
	Wq1dWkXC2rrWknqbRFDrAQ9RyNcOqtF0ZzDwlwmF/0O5/eu5Qq+rwrlA7G+hQZY8O2Uq
	GH+hH2wph91TuxwUWn+T20uENRW8PeiKKp3h9HiwbwdUfVfwaGEkZKk1bpHOrhgWj2Ca
	mLXXsGupJtLVEbNZNK/5w3uf0t05d+m6LCwAOPCCzXE/ju/raQD5dx5YOhUGFH+/AVB7
	cLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qHMQQFJ8ef4xp5s3qPv5DoTzcScdvyLUOuW6mWIyKPU=;
	b=bWC6mmjW27CL4WqRotIi57ceMHMbIRBRIrkdv2MuChVSN5vdLkZimprml0xAOWeWTy
	kMXyCA70SwMVPOxhd08Du5803ySWiUyxcueNOwNRO+co7QVVhSv8W5TpjFlCO+eY0T5J
	9egDgOeUGMd1Hkfa94XqfMtAI8WDStL6VyqLMoOC39oEIX4tsNbhgtEyK2uEseMfiyPe
	r4zp08rwhgbNcBaCBU47dg8g3M2JMVaG0euI34xT6ICNtvGXuBtaAyuemT0s5SG6ATns
	xHutVVQSa13TszZcs8CwNGxIxdbDmCW57zTTV6fo17qY9WusSe1RwESlaRcWJUrRT/xN
	Q3MQ==
X-Gm-Message-State: ALQs6tBYuSVirootZm4D5/frUQ/Bf2+n1yTg2NoB0IyHUf4livft7lKw
	cAOGoBvXYM3yP5ySwS0q7WRpRmoP
X-Google-Smtp-Source: AIpwx49n5ipBTALbHOeIAZ3ebn1YDu5ernk50XqeNmgB+2+K2w4XM3Zoo1NKP9dpNf4N6ddM1w91CA==
X-Received: by 2002:a24:7385:: with SMTP id
	y127-v6mr852652itb.10.1523556273529; 
	Thu, 12 Apr 2018 11:04:33 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w133-v6sm1118946itc.1.2018.04.12.11.04.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 Apr 2018 11:04:32 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1523556271.9182.15.camel@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Thu, 12 Apr 2018 13:04:31 -0500
In-Reply-To: <20180412165134.GI4939@edge>
References: <20180402194728.21389-1-JPEWhacker@gmail.com>
	<20180402202008.GD27229@edge> <1522702824.2942.13.camel@gmail.com>
	<20180412165134.GI4939@edge>
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/rocko/master][PATCH] ti-pdk: Weakly assign PARALLEL_XDC
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
X-List-Received-Date: Thu, 12 Apr 2018 18:04:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-04-12 at 12:51 -0400, Denys Dmytriyenko wrote:
> On Mon, Apr 02, 2018 at 04:00:24PM -0500, Joshua Watt wrote:
> > On Mon, 2018-04-02 at 16:20 -0400, Denys Dmytriyenko wrote:
> > > On Mon, Apr 02, 2018 at 02:47:28PM -0500, Joshua Watt wrote:
> > > > Allowing it to be overridden in local.conf
> > > 
> > > Why?
> > 
> > For some reason, when some ti-pdk recipes are built on my machine,
> > the
> > number of threads explodes exponentially.... It ends up launching
> > several hundreds to thousands of threads which consequently make my
> > computer unresponsive for quite a while, and I usually have to
> > reboot
> > it afterwards because something important stopped working.
> > 
> > I think for some reason the --jobs= flag is getting compounded
> > recursively.
> > 
> > Admittedly, there appears to be some deeper bug with the job
> > parallelism that needs to be looked into, but this at least allows
> > me
> > to continue working (by setting PARALLEL_XDC = "" in local.conf) in
> > the
> > meantime.
> > 
> > I'm on the latest HEAD of morty BTW.
> 
> Do you only see this behavior on morty? What about rocko/master?
> 
> I've asked around and we don't see this issue internally and we do a
> lot of 
> builds in our build farm on a daily basis...
> 
> Since this is otherwise a harmless change, I don't mind merging it.
> Please let 
> me know if you actually do need it in all 3 branches. Thanks.

Ya, sorry. I've been meaning to loop back around on this one. I was
able to track this down a bit further to the ti-ipc-rtos recipe. For
some reason, that specific recipe behaves very poorly on my machine,
launching thousands of threads. I'm not sure where to go about
debugging that if you happen to have any hints, I can look into it.

For some reason, the ti-ipc-rtos recipe doesn't respect PARALLEL_XDC
like all the other recipes, as it manually adds:

 JOBS="--jobs=${BB_NUMBER_THREADS}"

to EXTRA_OEMAKE. I had to make an additional local change:

 JOBS="${PARALLEL_XDC}"


If that can be sorted out, this patch is probably not necessary on all
branches at the current time. It does seem like behavior that would be
nice to control, but I think it is also incomplete at this point
because you probably want the change described above, and also want to
add:

 BB_HASHBASE_WHITELIST_append = " PARALLEL_XDC"

to layer.conf to prevent changes to the variable from causing
unnecessary rebuilds.

I'll push up a new patchset with these changes and you can decide if
you want it on master. Any insight (or debugging tips) as to why ti-
ipc-rtos behaves so badly (on morty at least) would be greatly
appreciated.

Thanks,
Joshua Watt
 
> 
> 
> > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > ---
> > > >  classes/ti-pdk.bbclass | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> > > > index 540a665c..0b0c9ffe 100644
> > > > --- a/classes/ti-pdk.bbclass
> > > > +++ b/classes/ti-pdk.bbclass
> > > > @@ -63,7 +63,7 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
> > > >  
> > > >  TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
> > > >  
> > > > -PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
> > > > +PARALLEL_XDC ?= "--jobs=${BB_NUMBER_THREADS}"
> > > >  PARALLEL_MAKE = ""
> > > >  
> > > >  def get_doxygen_support(d):
> > > > -- 
> > > > 2.14.3
> > > > 
> > > > -- 
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti

