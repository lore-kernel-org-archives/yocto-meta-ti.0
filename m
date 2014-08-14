Return-Path: <dv@pseudoterminal.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0872E00781; Thu, 14 Aug 2014 07:31:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21526E0074B
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 07:30:55 -0700 (PDT)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 1FE25331EA;
	Thu, 14 Aug 2014 16:30:54 +0200 (CEST)
Message-ID: <53ECC823.8010800@pseudoterminal.org>
Date: Thu, 14 Aug 2014 16:30:59 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Diego Sueiro <diego.sueiro@gmail.com>, 
 Denys Dmytriyenko <denys@ti.com>
References: <53ECBC66.4070509@pseudoterminal.org> <20140814140331.GW23523@edge>
	<CAMCfZKG1yX1usuAFGeCKUvVpejy9k9TGRy-2QnieJHCpUKsH_g@mail.gmail.com>
In-Reply-To: <CAMCfZKG1yX1usuAFGeCKUvVpejy9k9TGRy-2QnieJHCpUKsH_g@mail.gmail.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Beaglebone Black and libgles-omap3 : build problem
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
X-List-Received-Date: Thu, 14 Aug 2014 14:31:06 -0000
Content-Type: multipart/alternative;
	boundary="------------050104010605060708030404"

--------------050104010605060708030404
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-14 16:07, Diego Sueiro wrote:
> Hi,
>
> On Thu, Aug 14, 2014 at 11:03 AM, Denys Dmytriyenko <denys@ti.com 
> <mailto:denys@ti.com>> wrote:
>
>     Don't use beaglebone machine from meta-yocto-bsp, but instead use
>     beaglebone
>     machine from meta-ti, if you want to use other components from
>     meta-ti...
>
>
> Just complementing. Remove meta-yocto-bsp from your bblayers.conf
>
> Regards,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br 
> <http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
>
> /*long live rock 'n roll*/

Thanks! Such an easy an obvious solution. Apparently I thought too 
complicated again :)
It works now.

--------------050104010605060708030404
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2014-08-14 16:07, Diego Sueiro
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAMCfZKG1yX1usuAFGeCKUvVpejy9k9TGRy-2QnieJHCpUKsH_g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Hi,</div>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Thu, Aug 14, 2014 at 11:03 AM,
            Denys Dmytriyenko <span dir="ltr">&lt;<a
                moz-do-not-send="true" href="mailto:denys@ti.com"
                target="_blank">denys@ti.com</a>&gt;</span> wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2y0" class="a3s" style="overflow:hidden">Don't
                use beaglebone machine from meta-yocto-bsp, but instead
                use beaglebone<br>
                machine from meta-ti, if you want to use other
                components from meta-ti...</div>
            </blockquote>
          </div>
          <br>
          Just complementing. Remove meta-yocto-bsp from your
          bblayers.conf</div>
        <div class="gmail_extra"><br clear="all">
          <div>
            <div dir="ltr">
              <div>Regards,</div>
              <div><br>
              </div>
              --<br>
              *dS<br>
              Diego Sueiro<br>
              <br>
              Administrador do Embarcados<br>
              <a moz-do-not-send="true"
href="http://www.embarcados.com.br/?utm_source=assinatura_diego&amp;utm_medium=e-mail&amp;utm_campaign=Assinatura%20Email%20Diego"
                target="_blank">www.embarcados.com.br</a><br>
              <br>
              /*long live rock 'n roll*/<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Thanks! Such an easy an obvious solution. Apparently I thought too
    complicated again :)<br>
    It works now.<br>
  </body>
</html>

--------------050104010605060708030404--
