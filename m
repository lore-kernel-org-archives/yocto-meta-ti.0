Return-Path: <ebutera@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 765F9E00AFD; Fri, 13 Jun 2014 07:32:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.1 DKIM_SIGNED Message has a DKIM or DK signature,
	not necessarily *      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.178 listed in list.dnswl.org]
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CDC9E0073D
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 07:32:32 -0700 (PDT)
Received: by mail-ob0-f178.google.com with SMTP id wn1so2892132obc.23
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 07:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5asviE3POgeTscVF86CMskCJt7V5XyrmnpuUnaX9RDc=;
	b=WbIrGxzC1vIWlZKHwSFpj38UMzBCuXkfyspVjR0raTBJMjKTsfBy2K9Cf4QRN+x++S
	hSiCBwZsUagE5FdQnwlmnGkAxyJ+C0nXVC3LztMSekXSSm7n5VLjmdR/67yjI01stqq0
	7SzaxxPL9ER/4A4xMxDdvspH+2O022Y7SmvUdG/U2QcxYLzUADIj2rgNoKRavGtO1e48
	Fcon9wSI+jIsdkUSFRM6Z8F6AwRG46GyTxppCnoyFTratONHKRWR15arqSsM1/Tex/rR
	7rhZpquTsFZNItxEZAz7dxIBFvgXri/Tp2EJB32dTmQ29w0qq5dvQSQ/RW+onfr5BEl9
	b1hw==
MIME-Version: 1.0
X-Received: by 10.182.255.201 with SMTP id as9mr3263775obd.44.1402669951105;
	Fri, 13 Jun 2014 07:32:31 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.182.159.106 with HTTP; Fri, 13 Jun 2014 07:32:31 -0700 (PDT)
In-Reply-To: <CAK8F28==cQTSqjy+hg2VZX_6q4RcPHBUJzKwRFTYbRR6AnWfUw@mail.gmail.com>
References: <CAK8F28kqBnnWBgdk3TXHqBLVW25sVchmQ-eUVf5ujbh=6Dcwtw@mail.gmail.com>
	<20140611025637.GK18034@edge>
	<CAK8F28khwqPSrfonrhqWDDe=_=Mn1602z8w-h3EYV9x_3oU4-g@mail.gmail.com>
	<CA+2YH7vFhA8y4e6Jyb-mrQtxr_3Ad11utaq8EsmNHa_AiyKNqg@mail.gmail.com>
	<CAK8F28==cQTSqjy+hg2VZX_6q4RcPHBUJzKwRFTYbRR6AnWfUw@mail.gmail.com>
Date: Fri, 13 Jun 2014 16:32:31 +0200
X-Google-Sender-Auth: tY68O-YkwDu4uPmplV0c3RNWINY
Message-ID: <CA+2YH7uGm+wgmRggQ3+hDOtX7s51FaXJdgK9J-RfCrLa+gpxKA@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Ash Charles <ashcharles@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: DSP packages for OMAP3
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
X-List-Received-Date: Fri, 13 Jun 2014 14:32:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 13, 2014 at 1:09 AM, Ash Charles <ashcharles@gmail.com> wrote:
> On Wed, Jun 11, 2014 at 7:35 AM, Enrico <ebutera@users.sourceforge.net> wrote:
>> If you have no specific reason to update the CGT you will just waste
>> your time, it's a miracle that it's still working as it is...infact
>> i'm using it so i can say that it works.
> I had to make a few patches to get gstreamer-ti and friends to compile
> with yocto-master.  Send patches to meta-ti?

Sure :)

>> Unfortunately the libraries are only soft float, so no hard float
>> support. The problem is not in the makefiles (well maybe some patching
>> is needed), you will just get link errors.
> What packages actually contained pre-built binaries?  I see a bunch of
> arm binaries with the extension .xv5T but I've been struggling to
> figure out what binaries are pre-compiled.

i don't know, probably you can do a "make clean" in the various ti-*
tools and see what libraries are not deleted (some recipes do that
before compiling), but i never spent time trying to figure it out.

Maybe someone from TI can remember that.

Enrico

