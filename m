Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8E50E00E40; Tue,  5 Jun 2018 14:27:16 -0700 (PDT)
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
	*      [209.85.214.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8074CE00CE7
	for <meta-ti@yoctoproject.org>; Tue,  5 Jun 2018 14:27:15 -0700 (PDT)
Received: by mail-it0-f67.google.com with SMTP id k17-v6so15641144ita.0
	for <meta-ti@yoctoproject.org>; Tue, 05 Jun 2018 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yVrcyjrKaEeqsxYik83kS8qQJa+NMh3ZGQp9m7wMkaQ=;
	b=lqSBsmg30z1URiQq4VilmIReRM7BRbQu+B6n9TMqFGHZ/f2J9GOODgFwcBxbLXQzrl
	aDOZPG1z7KUFjhgxhqagZrpQa8KiRye16tYkEOtNuNadj1VEA+w5BxUDqFn5NY40VIFS
	8UC9dsGF8Nth1PvoEHWUwXGqMc2JcXISOcSdA5c+LsXJowkVJKpYV2lOq7xTR3Y9P4yJ
	WNs3u+CxNyiEzlVttpiMdr1T9xQoPMaMK42Cbc8PvwgGP9KhvNnCjiDDQ0bWHgIHzJTN
	57oAe1e5jnLFCpQlwS1zSrnBhjJpRtrXWNUq6hRh6PuVxJYqn4+AbxxYxguze04IJpyu
	gkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yVrcyjrKaEeqsxYik83kS8qQJa+NMh3ZGQp9m7wMkaQ=;
	b=Rz56XJfdvaqLMV8K/TGGHUXIDNazf6GzZQuaQZAeOj1MFMkm67hXbpVex82ZYxm/nA
	06RG4NCdX400P1gtMaJlUWQILwGrAIrLhLl63yfbfh3wJbA4VR6WvZRf2oOMy67IQRwD
	sAVuO+p/M4tafbxjH6qE4EBMVgp+j7E4LhVInAp9AAd5NLP7KslzYnGNMxx1iB7QL+Np
	OndY5lOnzevG8n0lXgZNYCmokURDgQYI2cP5o5h3sA3oZdDSZCoa5enEdDHSgb43AwaI
	YvuJVk985b/Mgkv3lx3KvmoPIjy5J1A+eUAdNb27lL0eXAe6dt06zR7FwImbPva5ChYm
	Rhrw==
X-Gm-Message-State: APt69E1CPY5/zP0LessshZ1I3v0VXEdezSmBFD5u6U8SFesjD2Ag7ugn
	phX+YLturHeAQTQVf/uvDDw=
X-Google-Smtp-Source: ADUXVKL4G2MV84l2/lasUwENiEcd0DNdX6wUtpKwvp8ZFXO05nOE3GZQFDhZqcZIAGSWfWDXiFIq7w==
X-Received: by 2002:a24:641:: with SMTP id 62-v6mr902064itv.89.1528234034738; 
	Tue, 05 Jun 2018 14:27:14 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	y8-v6sm5368152ioc.50.2018.06.05.14.27.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Jun 2018 14:27:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <f3f1d55efd0e8df6d2bf24f9b5111ab0d95aa9e2.camel@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Tue, 05 Jun 2018 16:27:13 -0500
In-Reply-To: <20180605183453.GB19965@denix.org>
References: <20180605144512.28829-1-JPEWhacker@gmail.com>
	<20180605183453.GB19965@denix.org>
X-Mailer: Evolution 3.28.2 (3.28.2-1.fc28) 
Mime-Version: 1.0
Cc: meta-ti@yoctoproject.org, timothy.mertz@garmin.com
Subject: Re: [morty/rocko/master][PATCH] ti-xdctools-common: Add XDC tools to -dev package
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
X-List-Received-Date: Tue, 05 Jun 2018 21:27:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-06-05 at 14:34 -0400, Denys Dmytriyenko wrote:
> Do you still need this on morty?

If possible. We are (unfortunately) still on morty.

> 
> On Tue, Jun 05, 2018 at 09:45:12AM -0500, Joshua Watt wrote:
> > b42044aaf removed the XDC tools from the main package, but this
> > broke
> > the ability to include the XDC tools in an SDK. Add the tools back
> > to
> > the -dev package. Also fix up INSANE_SKIP.
> > 
> > Change-Id: I902cc1a841e40c1a3bdc5286d03f999276119052
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  recipes-ti/devtools/ti-xdctools-common.inc | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-
> > ti/devtools/ti-xdctools-common.inc
> > index d2d0df45..a3949cad 100644
> > --- a/recipes-ti/devtools/ti-xdctools-common.inc
> > +++ b/recipes-ti/devtools/ti-xdctools-common.inc
> > @@ -13,12 +13,14 @@ do_install() {
> >      cp ${CP_ARGS}  ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
> >  }
> >  
> > +FILES_${PN}-dev = "${XDC_INSTALL_DIR_RECIPE}"

I was going to ask about this.... It seems counter to the mechanism
used in some of the other (TI) recipes to put these files in the -dev
package. It seems that most recipes that are intended to be native
tools include their files in the "${PN}" package instead of the "${PN}-
dev" package. For example, ti-cgt-pru, ti-cgt-arm-native, and ti-cgt6x-
7-native all do this. The recipes that are putting files in "-dev"
appear to be on-target recipes. This layout makes more sense to me, and
fits better with our use case. What we would like to do is add:
 
 TOOLCHAIN_HOST_TASK += "nativesdk-ti-xdctools"

however, with this patch as currently written, we would have to do:

 TOOLCHAIN_HOST_TASK += "nativesdk-ti-xdctools-dev"


I used -dev in this patch because the referenced commit removed the
files from "${PN}", and I wasn't sure if there was a reason (that, and
at the time I didn't fully comprehend the difference between native and
target recipes that I described above). Do you know if there was a
reason the FILE_${PN} was removed in b42044aaf?

Thanks,
Joshua Watt

> > +
> >  BBCLASSEXTEND = "native nativesdk"
> >  
> >  INHIBIT_PACKAGE_STRIP = "1"
> >  INHIBIT_SYSROOT_STRIP = "1"
> >  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > -INSANE_SKIP_${PN} = "installed-vs-shipped"
> > +INSANE_SKIP_${PN}-dev = "libdir dev-elf arch file-rdeps"
> >  
> >  # Prevent internal libs from getting picked up
> >  PRIVATE_LIBS = " \
> > -- 
> > 2.17.0
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> > 

