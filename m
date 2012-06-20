Return-Path: <jkridner@beagleboard.org>
Received: from mail-gg0-f176.google.com (mail-gg0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51A47E013A6
	for <meta-ti@yoctoproject.org>; Wed, 20 Jun 2012 07:09:26 -0700 (PDT)
Received: by ggnk4 with SMTP id k4so6548198ggn.35
	for <meta-ti@yoctoproject.org>; Wed, 20 Jun 2012 07:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=AX2fgBREtJsCNpfbZIo700CMjQGLqGRrMwvK4nNMV5g=;
	b=L10fCi5ceLUPG0WbhvSdPgk+evWPZmR+s7o+4Ziq7t4zApoBIldXg9x94nyysCYrUu
	+4TJYDt142KbQHHQd9FSGuiVv4uz3iQGnjsYgIR2bBEROcE7FcOtf29Bf7uISHmZNxNI
	WmqzfQ6Rd5eL2Ey5wbXQxOvy1JlchmpsvQLr2L4EtXLxwXXfZT+h375AQ1f3tuPo29DA
	pIusaSf+QrOXtCJEuKLnmk2F1+fCm8wjJYfyh3fu1Z7bJWN3geIzpaaD3Gwpj71R2/fU
	onRSoHaYID+UsutPoKOSZR6tqCCPP52gfNB4tnH8cBERNVanaP+EFAvrfvIDgSdqOfXt
	4f1w==
Received: by 10.100.231.2 with SMTP id d2mr8434282anh.41.1340201365546;
	Wed, 20 Jun 2012 07:09:25 -0700 (PDT)
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mx.google.com with ESMTPS id d10sm40310537anm.17.2012.06.20.07.09.23
	(version=SSLv3 cipher=OTHER); Wed, 20 Jun 2012 07:09:24 -0700 (PDT)
Received: by obbwd18 with SMTP id wd18so10003128obb.35
	for <meta-ti@yoctoproject.org>; Wed, 20 Jun 2012 07:09:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.36.102 with SMTP id p6mr23621838obj.77.1340201363467; Wed,
	20 Jun 2012 07:09:23 -0700 (PDT)
Received: by 10.182.227.74 with HTTP; Wed, 20 Jun 2012 07:09:23 -0700 (PDT)
In-Reply-To: <CADZ6=asjiF6zr6QrPJa=H0g++RnL9xY21w_poW=Ab9tRFi=2_g@mail.gmail.com>
References: <20120612011706.GD30300@denix.org>
	<CADZ6=avUy_QP2E7cgDuU9redCXyb8JNzWhFhwMxXC10NiSSMYw@mail.gmail.com>
	<CA+T6QPkvE=AvpDOQJ4TR9ETadxWpyv0VVd4Z5eVVLNY2AxfymA@mail.gmail.com>
	<CADZ6=asjiF6zr6QrPJa=H0g++RnL9xY21w_poW=Ab9tRFi=2_g@mail.gmail.com>
Date: Wed, 20 Jun 2012 10:09:23 -0400
Message-ID: <CA+T6QP==TmOD3wgykvdAD-tfti5HU+M2=GhpnRTaD7ef+sdQuQ@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Thilo Fromm <fromm@dresearch-fe.de>
X-Gm-Message-State: ALoCoQl4qBSV2+2sCHWC4mwKgwb4UBNXhIu5tW/3Z1QOl38DKY+2SI5t+jSk9pz7C3O2NU37aqwT
Cc: meta-ti@yoctoproject.org
Subject: Re: RFC: creating "extras" layer
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2012 14:09:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 3:12 AM, Thilo Fromm <fromm@dresearch-fe.de> wrote:
> Hello Jason,
>
>>> From a platform perspective your split makes a lot of sense imho.
>>> Especially if there is no active maintenance (let alone development)
>>> for the "extras" platforms. The euphemistic choice of naming puzzles
>>> me, though. I take it that by "extras" you actually mean "deprecated"
>>> or "unmaintained"? If so then please consider naming it that way.
>>> "extras" really suggests some added sugar to the "core" recipes of
>>> meta-ti, which doesn't really coin what you intend to do with it. If
>>> you need to be euphemistic please at least choose a name in the right
>>> context, like something along the lines of "attic", or "basement".
>>
>> I believe this interpretation is a good reason not to make this split
>> at this time. =A0While I appreciate that some platforms will have more
>> resources given to updates at various times than others, I don't
>> believe this split generates an easy-to-grok understanding of the
>> platform status. =A0I'd suggest providing links to automated test
>> reports and something akin to a MAINTAINERS file for a better
>> indication of platform/recipe status/ownership.
>
> I feel this would obfuscate the state of support for different TI
> platforms even further. Denys made a technological decision which
> makes sense. Your arguments against the split are more likely to be
> driven by marketing. Not separating the platforms even now when we
> have statements about which platform will receive support in the
> future and which would not really does not help transparency. Finding
> platform support recipes within a "meta-deprecated/" sub-layer is way
> more telling than having a note way down a README or a MAINTAINERS
> file.
>
> As Denys noted, every platform which is supported can be moved out of
> the new meta-layer and back into its original place anytime. If you
> don't like a platform being in "extras/" (or, better,
> "meta-deprecated/"), just start supporting it.

I agree in principal that clearly annotating recipes without support
is critical to avoid wasting the time of developers.  My concerns
include:
* Patch churn moving recipes in-and-out of the extras layer
* Duplication of recipes between the main layer and the extras layer
* Conflict between BSP components
* Recipes in the main layer that are no better supported that recipes
in the extras layer

The way I see it is that Denys, with the full support of TI, has
ultimate responsibility for support of all of meta-ti and should hold
myself and others both inside and outside of TI individually
responsible to support our contributions.  If he feels that these
sections are not up to his standards to be able to support in the main
layer, then I regretfully acknowledge and respect his decision.  It is
simply my opinion that he should seek other methods to hold the
developers accountable for the quality of these components, rather
than push them out.  He's most aware of his ability to assert such
control over the quality of that code.

It wasn't my intention that a MAINTAINERS file was a method for
identifying poor-quality code, but rather to enable Denys to hold
individuals accountable.  Further, it wasn't my intention that
publishing of test results would be used as a perpetual excuse for not
fixing issues, but rather to highlight them to help focus the
maintainers on what issues to solve and give Denys the tools he needs
to identify code that should be pushed out such that meta-ti can be of
consistently good quality, especially around the time of Yocto-related
snapshots.

>
> Regards,
> Thilo
>
> --
> Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
> Tel: +49 (30) 515 932 228 =A0 mailto:fromm@dresearch-fe.de
> Fax: +49 (30) 515 932 77 =A0 =A0http://www.dresearch.de
> Amtsgericht: Berlin Charlottenburg, HRB 130120 B
> Ust.-IDNr. DE273952058
> Gesch=E4ftsf=FChrer: Dr. M. Weber, W. M=F6gle

