Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5289EE00C25; Mon,  2 Apr 2018 14:00:27 -0700 (PDT)
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
	*      [209.85.223.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C768E00843
	for <meta-ti@yoctoproject.org>; Mon,  2 Apr 2018 14:00:24 -0700 (PDT)
Received: by mail-io0-f194.google.com with SMTP id q84so19395758iod.10
	for <meta-ti@yoctoproject.org>; Mon, 02 Apr 2018 14:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qUrNTrGXhA29z3RU/NHPtX1s4PSiGkprsv8ODKUsT8Q=;
	b=u9OHcfWtbyIGkqpaTuMidzqUZdbIsbYn1ZrFCn6so4zWsgxoaLtK+/tBaWQqxcnlK/
	UdQGNqjTvxLp1uEqu58e+2D3TJqDGUP7l3odKV9oEbFVUYyz0RrHWuqGsMOQdR48K/W2
	9imaU1HdXCDTcdZlvqtjw1oAonhD3v8pZ7DacMZZ4sUiEK1t60aA646RUMVLBj5KfZwO
	dEYGwzFLCFEXhuh00Zj23v1/EMwxeSoiLq2e1VRkjd4th+x5jvvZ95qaPAu7c6nyGOIC
	QFnPCS3dgmHBzMIf/Qudwad4cWmQsB+U9W194JIXf1NgpDOMajREIevTfdJKXa8iAcIH
	2uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qUrNTrGXhA29z3RU/NHPtX1s4PSiGkprsv8ODKUsT8Q=;
	b=WSBfT1L844YKQplHFy68437+1eK62OCJ2eBJgAepnnWXKwbaCKGl7cN7dSyc7P7NgY
	D/onV48fwa0HH4Q5owg/xWv8uEHLfyscqX4mcJTGvgHpd/UK5ZMMJbr/O9kocELID036
	DpPP6a2euvUz+ZYhZ68V4LEosDD1b0fWSTvMCtdN8o2mgTXa3/3xTHQSztW/bSbMxPH7
	EwUllmO5GQXgaKwY34jsjkHCbdE5h3Jc0ttr1R89ZOCY8kc6hzYl8RW4kbE9/wUXEu9+
	Bxhqm9pt5cdLxgUoF/Up26LuqqPibxmf1N8pU1tKZil7vXhvEeY2tNNlxLddV7pz/Y4t
	5ESw==
X-Gm-Message-State: ALQs6tCmR/1iOCEbQuV5S1V/1TaQdx8yrlrtN6H3MXYobJ3dfI4XkxhF
	K9E59R0Ti2kYz9E8HP2p7/I=
X-Google-Smtp-Source: AIpwx49WwMvX6giT2uoXXOkWDlCDfjuhebYsDp60E2B5YZlU+xXTjqLHn3cDPP+5IDIBSo6LmXnEgw==
X-Received: by 10.107.200.204 with SMTP id y195mr10302600iof.252.1522702824250;
	Mon, 02 Apr 2018 14:00:24 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	q126sm552324iof.68.2018.04.02.14.00.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Apr 2018 14:00:23 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1522702824.2942.13.camel@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Mon, 02 Apr 2018 16:00:24 -0500
In-Reply-To: <20180402202008.GD27229@edge>
References: <20180402194728.21389-1-JPEWhacker@gmail.com>
	<20180402202008.GD27229@edge>
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
X-List-Received-Date: Mon, 02 Apr 2018 21:00:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-04-02 at 16:20 -0400, Denys Dmytriyenko wrote:
> On Mon, Apr 02, 2018 at 02:47:28PM -0500, Joshua Watt wrote:
> > Allowing it to be overridden in local.conf
> 
> Why?

For some reason, when some ti-pdk recipes are built on my machine, the
number of threads explodes exponentially.... It ends up launching
several hundreds to thousands of threads which consequently make my
computer unresponsive for quite a while, and I usually have to reboot
it afterwards because something important stopped working.

I think for some reason the --jobs= flag is getting compounded
recursively.

Admittedly, there appears to be some deeper bug with the job
parallelism that needs to be looked into, but this at least allows me
to continue working (by setting PARALLEL_XDC = "" in local.conf) in the
meantime.

I'm on the latest HEAD of morty BTW.

> 
> 
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  classes/ti-pdk.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> > index 540a665c..0b0c9ffe 100644
> > --- a/classes/ti-pdk.bbclass
> > +++ b/classes/ti-pdk.bbclass
> > @@ -63,7 +63,7 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
> >  
> >  TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
> >  
> > -PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
> > +PARALLEL_XDC ?= "--jobs=${BB_NUMBER_THREADS}"
> >  PARALLEL_MAKE = ""
> >  
> >  def get_doxygen_support(d):
> > -- 
> > 2.14.3
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

