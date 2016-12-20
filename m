Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69BE2E00A64; Tue, 20 Dec 2016 12:31:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06BA2E00955
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 12:31:54 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBKKVmnE025936;
	Tue, 20 Dec 2016 14:31:48 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBKKVm8N008317;
	Tue, 20 Dec 2016 14:31:48 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 14:31:47 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBKKVlCo003928;
	Tue, 20 Dec 2016 14:31:47 -0600
To: Christopher Larson <clarson@kergoth.com>
References: <1482250466-32489-1-git-send-email-j-stiffler@ti.com>
	<CABcZAN=hyfYC8SqiwSzX_8pUe-o7kDxCgWobCUBMrP0mV0E2sg@mail.gmail.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <1ba5741e-9f59-45cf-d2e0-7a20a72ccbcb@ti.com>
Date: Tue, 20 Dec 2016 15:31:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CABcZAN=hyfYC8SqiwSzX_8pUe-o7kDxCgWobCUBMrP0mV0E2sg@mail.gmail.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] pruss-lld: set CLEANBROKEN
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
X-List-Received-Date: Tue, 20 Dec 2016 20:31:57 -0000
Content-Type: multipart/alternative;
	boundary="------------AC9F2137A9B8CBD52301A0AB"

--------------AC9F2137A9B8CBD52301A0AB
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 12/20/2016 12:54 PM, Christopher Larson wrote:
>
> On Tue, Dec 20, 2016 at 9:14 AM, Jacob Stiffler <j-stiffler@ti.com 
> <mailto:j-stiffler@ti.com>> wrote:
>
>     * The Linux binaries are built by the "makefile_armv7".
>     * pruss-lld provides a "makefile", but it is used for building the
>       RTOS binaries.
>     * This "makefile" requires the ti-pdk-build-rtos package and is broken
>       without it, so therefore set CLEANBROKEN instead of pulling in
>       unnecessary dependencies.
>
>     Signed-off-by: Jacob Stiffler <j-stiffler@ti.com
>     <mailto:j-stiffler@ti.com>>
>
>
> Could you not just make sure the -f is passed to the clean?
>
> EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}”

This works. I will send out the v2.

> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics


--------------AC9F2137A9B8CBD52301A0AB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 12/20/2016 12:54 PM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZAN=hyfYC8SqiwSzX_8pUe-o7kDxCgWobCUBMrP0mV0E2sg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Tue, Dec 20, 2016 at 9:14 AM,
            Jacob Stiffler <span dir="ltr">&lt;<a
                moz-do-not-send="true" href="mailto:j-stiffler@ti.com"
                target="_blank">j-stiffler@ti.com</a>&gt;</span> wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id="gmail-:1mm" class="gmail-a3s gmail-aXjCH
                gmail-m1591d0d514f9e25d">* The Linux binaries are built
                by the "makefile_armv7".<br>
                * pruss-lld provides a "makefile", but it is used for
                building the<br>
                  RTOS binaries.<br>
                * This "makefile" requires the ti-pdk-build-rtos package
                and is broken<br>
                  without it, so therefore set CLEANBROKEN instead of
                pulling in<br>
                  unnecessary dependencies.<br>
                <br>
                Signed-off-by: Jacob Stiffler &lt;<a
                  moz-do-not-send="true" href="mailto:j-stiffler@ti.com">j-stiffler@ti.com</a>&gt;</div>
            </blockquote>
          </div>
          <br>
          Could you not just make sure the -f is passed to the clean?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">EXTRA_OEMAKE += "-f makefile_armv7
          PDK_INSTALL_PATH=${STAGING_INCDIR}”</div>
      </div>
    </blockquote>
    <br>
    This works. I will send out the v2.<br>
    <br>
    <blockquote
cite="mid:CABcZAN=hyfYC8SqiwSzX_8pUe-o7kDxCgWobCUBMrP0mV0E2sg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">-- <br>
          <div class="gmail_signature">Christopher Larson<br>
            clarson at kergoth dot com<br>
            Founder - BitBake, OpenEmbedded, OpenZaurus<br>
            Senior Software Engineer, Mentor Graphics</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------AC9F2137A9B8CBD52301A0AB--
