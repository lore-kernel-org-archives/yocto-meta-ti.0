Return-Path: <ceh@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B392BE0086E; Fri,  9 Jan 2015 05:33:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D2D3E004D6
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 05:33:39 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t09DXc28014870
	for <meta-ti@yoctoproject.org>; Fri, 9 Jan 2015 07:33:38 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t09DXcVn021387
	for <meta-ti@yoctoproject.org>; Fri, 9 Jan 2015 07:33:38 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 9 Jan 2015 07:33:38 -0600
Received: from [158.218.103.10] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t09DXbSa016520	for
	<meta-ti@yoctoproject.org>; Fri, 9 Jan 2015 07:33:38 -0600
Message-ID: <54AFD8B1.2050505@ti.com>
Date: Fri, 9 Jan 2015 08:33:37 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
References: <CAMCfZKH_-v_S=mLiNLQVRZ_YmUYZgz1a6q8h_ZX5VRqfwjiESQ@mail.gmail.com>
In-Reply-To: <CAMCfZKH_-v_S=mLiNLQVRZ_YmUYZgz1a6q8h_ZX5VRqfwjiESQ@mail.gmail.com>
Subject: Re: pvrsrvkm failing on kernel 3.14.26 for am3359
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
X-List-Received-Date: Fri, 09 Jan 2015 13:33:52 -0000
Content-Type: multipart/alternative;
	boundary="------------030102090706080903060906"

--------------030102090706080903060906
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Diego,

The commit shown below should fix the issue.

Carlos

commit b35aa2398f8347e51dc29acc9bf1cc64e672ec22
Author: Pantelis Antoniou <panto@antoniou-consulting.com>
Date:   Wed Jan 7 13:52:08 2015 +0000

     arm: Export cache flush management symbols when !MULTI_CACHE

     When compiling a kernel without CONFIG_MULTI_CACHE enabled the
     dma access functions end up not being exported. Fix it.

     Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
     Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 1e8b030..c6a9a61 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -1080,3 +1080,12 @@ const struct seq_operations cpuinfo_op = {
         .stop   = c_stop,
         .show   = c_show
  };
+
+/* export the cache management functions */
+#ifndef MULTI_CACHE
+
+EXPORT_SYMBOL(__glue(_CACHE,_dma_map_area));
+EXPORT_SYMBOL(__glue(_CACHE,_dma_unmap_area));
+EXPORT_SYMBOL(__glue(_CACHE,_dma_flush_range));
+
+#endif


On 01/09/2015 05:41 AM, Diego Sueiro wrote:
> Folks,
>
> I have recently updated my meta-ti daisy branch and noticed that 
> omap3-sgx-modules are not being loaded.
>
> Here is the log for 3.14.26 kernel (from meta-ti commit 
> 1d46274416c3b50808590963bdb6c157d9d7c745):
>
>     pvrsrvkm: Unknown symbol v7_dma_map_area (err 0)
>     pvrsrvkm: Unknown symbol v7_dma_flush_range (err 0)
>     insmod: ERROR: could not insert module
>     /lib/modules/3.14.26/kernel/drivers/gpu/pvr/pvrsrvkm.ko: Unknown
>     symbol in module
>     Could not find pvrsrvkm driver
>
>
> The 3.14.25 kernel version (from meta-ti commit 
> 31348244882a8defb640af75119ba275d9915f09) is OK.
>
> I'm using the default kernel configuration.
>
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
>
>


--------------030102090706080903060906
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Diego,<br>
      <br>
      The commit shown below should fix the issue.<br>
      <br>
      Carlos<br>
      <br>
      commit b35aa2398f8347e51dc29acc9bf1cc64e672ec22<br>
      Author: Pantelis Antoniou <a class="moz-txt-link-rfc2396E" href="mailto:panto@antoniou-consulting.com">&lt;panto@antoniou-consulting.com&gt;</a><br>
      Date:&nbsp;&nbsp; Wed Jan 7 13:52:08 2015 +0000<br>
      <br>
      &nbsp;&nbsp;&nbsp; arm: Export cache flush management symbols when !MULTI_CACHE<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp; When compiling a kernel without CONFIG_MULTI_CACHE enabled the<br>
      &nbsp;&nbsp;&nbsp; dma access functions end up not being exported. Fix it.<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp; Signed-off-by: Pantelis Antoniou
      <a class="moz-txt-link-rfc2396E" href="mailto:panto@antoniou-consulting.com">&lt;panto@antoniou-consulting.com&gt;</a><br>
      &nbsp;&nbsp;&nbsp; Signed-off-by: Tomi Valkeinen <a class="moz-txt-link-rfc2396E" href="mailto:tomi.valkeinen@ti.com">&lt;tomi.valkeinen@ti.com&gt;</a><br>
      <br>
      diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c<br>
      index 1e8b030..c6a9a61 100644<br>
      --- a/arch/arm/kernel/setup.c<br>
      +++ b/arch/arm/kernel/setup.c<br>
      @@ -1080,3 +1080,12 @@ const struct seq_operations cpuinfo_op = {<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .stop&nbsp;&nbsp; = c_stop,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .show&nbsp;&nbsp; = c_show<br>
      &nbsp;};<br>
      +<br>
      +/* export the cache management functions */<br>
      +#ifndef MULTI_CACHE<br>
      +<br>
      +EXPORT_SYMBOL(__glue(_CACHE,_dma_map_area));<br>
      +EXPORT_SYMBOL(__glue(_CACHE,_dma_unmap_area));<br>
      +EXPORT_SYMBOL(__glue(_CACHE,_dma_flush_range));<br>
      +<br>
      +#endif<br>
      <br>
      <br>
      On 01/09/2015 05:41 AM, Diego Sueiro wrote:<br>
    </div>
    <blockquote
cite="mid:CAMCfZKH_-v_S=mLiNLQVRZ_YmUYZgz1a6q8h_ZX5VRqfwjiESQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div dir="ltr">
        <div>Folks,</div>
        <div><br>
        </div>
        <div>I have recently updated my meta-ti daisy branch and noticed
          that omap3-sgx-modules are not being loaded.</div>
        <div><br>
        </div>
        <div>Here is the log for 3.14.26 kernel (from meta-ti commit
          1d46274416c3b50808590963bdb6c157d9d7c745):</div>
        <blockquote style="margin:0px 0px 0px
          40px;border:none;padding:0px">
          <div>pvrsrvkm: Unknown symbol v7_dma_map_area (err 0)</div>
          <div>pvrsrvkm: Unknown symbol v7_dma_flush_range (err 0)</div>
          <div>insmod: ERROR: could not insert module
            /lib/modules/3.14.26/kernel/drivers/gpu/pvr/pvrsrvkm.ko:
            Unknown symbol in module</div>
          <div>Could not find pvrsrvkm driver</div>
        </blockquote>
        <div><br>
        </div>
        <div>The 3.14.25 kernel version (from meta-ti commit
          31348244882a8defb640af75119ba275d9915f09) is OK.<br>
        </div>
        <div><br>
        </div>
        <div>I'm using the default kernel configuration.</div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>
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
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------030102090706080903060906--
