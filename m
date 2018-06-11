Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3094E02272; Mon, 11 Jun 2018 10:54:36 -0700 (PDT)
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
	*      [209.85.214.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7269CE00EFC
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2018 10:54:35 -0700 (PDT)
Received: by mail-it0-f66.google.com with SMTP id l6-v6so12038796iti.2
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2018 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dX/XStzRSEAHTCCiHUdjtu7X3KuBV/kCJHqMH7jO7eg=;
	b=b2Xpho+f5DA6/dVQqzP0Xpl26n62dAgr8WlVB6MTWeCs9JNDNIexWjQht4UWqoQXhF
	oXXdfHPvAyB/lrntMltdomIyII5tp32cGwBkPEmp3R+GHdgj6eRTxnUNOOTayuPZWO19
	s8lH7UvbvqzPYZmxHqHV+Km5kwXZNPVKZP/SFnrq83DHwrstkjd2FglAmOIIe+TFNark
	2fvkrAQKJMdqL3Cd6n4Nj3P7e35syjYgAnPaNLdRZyFCGxf243t2h67fONPIi/fK8YDx
	Wx3g0BrltCWMBvX9rZjcXp36BpPnpONjPvzjMd5XvZZIPShmIfe/IEGdnHXMEd4vMD4D
	K5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dX/XStzRSEAHTCCiHUdjtu7X3KuBV/kCJHqMH7jO7eg=;
	b=TYrEkwZcsXf6AmJ8Qgxe+u640qivvP2byMPBLYze9c4WlE6pwD4H5vZaDte5yYGfCZ
	+XcDSJ4HykSdPXMYDQqCTIPmlA23jSGl0uUxIwaCnl8OLIEiMQW1iNiC/mGfls2qSG5H
	XxgjU6W9Wbhn7OYI5UXTNXR+RROLazrsEGebjm2Z98OMWVDy9OciNC6j2hxGSyFZJc3Q
	B754RHPEsSYovgNn8sUHoW4jAKxD1hSYoazSryjyPYYYYY1uQezNCz7V4HWj4N+KRXNd
	fW40XbCV/DBmYXjL5Hk8I106FLo5B4FVTdHAEH0FyM11j8rQT1lrVHgKA+SWmzvYMpPf
	ykkw==
X-Gm-Message-State: APt69E0CQWQ7p13WKV9KTO5KM9814e005dJHTowpSOngTkbPlHAu5k2b
	Fpxv99Vvmhdfn57T+0GIKH8=
X-Google-Smtp-Source: ADUXVKLbW+/+F7S0XPbozvbJ1GkpGYcAAkSX7g1EGjcUgqZBbTS9mzLhL6snwHW3RhsRVu/d4Tn+rA==
X-Received: by 2002:a24:4254:: with SMTP id
	i81-v6mr140755itb.123.1528739674557; 
	Mon, 11 Jun 2018 10:54:34 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	a200-v6sm12848100ioa.56.2018.06.11.10.54.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Jun 2018 10:54:34 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <de4d21eb50d8c9e08f200626da527c12769f5a0c.camel@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Mon, 11 Jun 2018 12:54:33 -0500
In-Reply-To: <f3f1d55efd0e8df6d2bf24f9b5111ab0d95aa9e2.camel@gmail.com>
References: <20180605144512.28829-1-JPEWhacker@gmail.com>
	<20180605183453.GB19965@denix.org>
	<f3f1d55efd0e8df6d2bf24f9b5111ab0d95aa9e2.camel@gmail.com>
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
X-List-Received-Date: Mon, 11 Jun 2018 17:54:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-06-05 at 16:27 -0500, Joshua Watt wrote:
> On Tue, 2018-06-05 at 14:34 -0400, Denys Dmytriyenko wrote:
> > Do you still need this on morty?
> 
> If possible. We are (unfortunately) still on morty.
> 
> > 
> > On Tue, Jun 05, 2018 at 09:45:12AM -0500, Joshua Watt wrote:
> > > b42044aaf removed the XDC tools from the main package, but this
> > > broke
> > > the ability to include the XDC tools in an SDK. Add the tools
> > > back
> > > to
> > > the -dev package. Also fix up INSANE_SKIP.
> > > 
> > > Change-Id: I902cc1a841e40c1a3bdc5286d03f999276119052
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  recipes-ti/devtools/ti-xdctools-common.inc | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/recipes-ti/devtools/ti-xdctools-common.inc
> > > b/recipes-
> > > ti/devtools/ti-xdctools-common.inc
> > > index d2d0df45..a3949cad 100644
> > > --- a/recipes-ti/devtools/ti-xdctools-common.inc
> > > +++ b/recipes-ti/devtools/ti-xdctools-common.inc
> > > @@ -13,12 +13,14 @@ do_install() {
> > >      cp ${CP_ARGS}  ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
> > >  }
> > >  
> > > +FILES_${PN}-dev = "${XDC_INSTALL_DIR_RECIPE}"
> 
> I was going to ask about this.... It seems counter to the mechanism
> used in some of the other (TI) recipes to put these files in the -dev
> package. It seems that most recipes that are intended to be native
> tools include their files in the "${PN}" package instead of the
> "${PN}-
> dev" package. For example, ti-cgt-pru, ti-cgt-arm-native, and ti-
> cgt6x-
> 7-native all do this. The recipes that are putting files in "-dev"
> appear to be on-target recipes. This layout makes more sense to me,
> and
> fits better with our use case. What we would like to do is add:
>  
>  TOOLCHAIN_HOST_TASK += "nativesdk-ti-xdctools"
> 
> however, with this patch as currently written, we would have to do:
> 
>  TOOLCHAIN_HOST_TASK += "nativesdk-ti-xdctools-dev"
> 
> 
> I used -dev in this patch because the referenced commit removed the
> files from "${PN}", and I wasn't sure if there was a reason (that,
> and
> at the time I didn't fully comprehend the difference between native
> and
> target recipes that I described above). Do you know if there was a
> reason the FILE_${PN} was removed in b42044aaf?
> 
> Thanks,
> Joshua Watt
> 
> > > +
> > >  BBCLASSEXTEND = "native nativesdk"
> > >  
> > >  INHIBIT_PACKAGE_STRIP = "1"
> > >  INHIBIT_SYSROOT_STRIP = "1"
> > >  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > > -INSANE_SKIP_${PN} = "installed-vs-shipped"
> > > +INSANE_SKIP_${PN}-dev = "libdir dev-elf arch file-rdeps"
> > >  
> > >  # Prevent internal libs from getting picked up
> > >  PRIVATE_LIBS = " \
> > > -- 
> > > 2.17.0
> > > 
> > > -- 
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > 

Ping?

