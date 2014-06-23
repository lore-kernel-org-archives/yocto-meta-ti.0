Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 471E4E00283; Mon, 23 Jun 2014 16:03:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.181 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ashcharles[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81451E0027B
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 16:03:12 -0700 (PDT)
Received: by mail-vc0-f181.google.com with SMTP id il7so6746388vcb.40
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 16:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ER28TcIbYBspusVpOp3jvTRKr7qaNpl5PHhdC9vcLeE=;
	b=Xx9ukEZhjyTJc43JTMzFlymsKgcHvhEZj2MsKGOmcvCaGC1KmZTHLJVEGIOGvp8KiO
	tb3sINCgpdb9xaPMPqKBYBLDCXPeRH2/n+qvU8AOJWVUcLDcHBnwT4VTuRIkgYb3Igle
	xQVMTd8frdz3nBva5ACSwIP+Mz3sXYpC9fDLJkV4x6+wIiptkRxsXyD2nvjjLnfxKTQu
	4YjDEc4sNcU9k7ztqPveDV1EqH5bOEtTy4oTPdimP7q8CcnI/JA00j3mojBZky0vbE4f
	pSyfLVctJ1u+1igWjYjvZOs0ZBTn6sDO7GqAIh1f4+tSrRoBCFoxwZcXdi+X4mK+cKKL
	BGtw==
X-Received: by 10.58.132.41 with SMTP id or9mr21853435veb.5.1403564592077;
	Mon, 23 Jun 2014 16:03:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.196.229 with HTTP; Mon, 23 Jun 2014 16:02:42 -0700 (PDT)
In-Reply-To: <20140623223333.GL6700@edge>
References: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
	<1402698848-13759-2-git-send-email-ashcharles@gmail.com>
	<20140623220500.GK6700@edge>
	<CAK8F28mucmU73EWJOWtBpCd60kBhGv97q-Vn0oGNT5U0hsUfxw@mail.gmail.com>
	<20140623223333.GL6700@edge>
From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 23 Jun 2014 16:02:42 -0700
Message-ID: <CAK8F28kbYkyvM6caRVb50M5CvvzmORWKmnW+MZ8kbBUuiWpHLw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/6] Set ${TOOLCHAIN_PATH} used by some recipes
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
X-List-Received-Date: Mon, 23 Jun 2014 23:03:19 -0000
Content-Type: text/plain; charset=UTF-8

Okay---I'll test and send a V2.

--Ash

On Mon, Jun 23, 2014 at 3:33 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> Well, I set it in our Arago distro based on the toolchain used, but since
> meta-ti is not a distro, I was thinking it should provide a safe default, but
> conditional. In other words, changing your patch to conditional assignment ?=
> should be good enough...
>
> --
> Denys
>
>
> On Mon, Jun 23, 2014 at 03:30:10PM -0700, Ash Charles wrote:
>> Good point.  Where is the right place to set the toolchain path?  Or
>> perhaps the recipes shouldn't use it at all?
>>
>> --Ash
>>
>> On Mon, Jun 23, 2014 at 3:05 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>> > This one is not correct and will break with an external toolchain...
>> >
>> > On Fri, Jun 13, 2014 at 03:34:04PM -0700, Ash Charles wrote:
>> >> Signed-off-by: Ash Charles <ashcharles@gmail.com>
>> >> ---
>> >>  recipes-ti/includes/ti-paths.inc | 1 +
>> >>  1 file changed, 1 insertion(+)
>> >>
>> >> diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
>> >> index 511b5ae..5c9b716 100644
>> >> --- a/recipes-ti/includes/ti-paths.inc
>> >> +++ b/recipes-ti/includes/ti-paths.inc
>> >> @@ -1,5 +1,6 @@
>> >>  installdir = "${datadir}/ti"
>> >>
>> >> +export TOOLCHAIN_PATH = "${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}"
>> >>  # This is where do_install will put it
>> >>  export AUDIO_SOC_INSTALL_DIR_RECIPE  = "${installdir}/ti-audio-soc-example-tree"
>> >>  export BIOS_INSTALL_DIR_RECIPE       = "${installdir}/ti-dspbios-tree"
>> >> --
>> >> 1.8.3.2
>> >>
>> >> --
>> >> _______________________________________________
>> >> meta-ti mailing list
>> >> meta-ti@yoctoproject.org
>> >> https://lists.yoctoproject.org/listinfo/meta-ti

