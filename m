Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5093DC433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 16:42:42 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web09.9895.1668098554691936538
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 08:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dLNv0lYg;
 spf=pass (domain: konsulko.com, ip: 209.85.219.175, mailfrom: denys.dmytriyenko@konsulko.com)
Received: by mail-yb1-f175.google.com with SMTP id i131so2783890ybc.9
        for <meta-ti@lists.yoctoproject.org>; Thu, 10 Nov 2022 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW3VoJVUdRiH81TcT4gskUhhWCKxzo16hLgf9fmp87Y=;
        b=dLNv0lYgWVGMJ2XEYBZtldQRgrsftFU45b7nXuLHqQMpkR7R0eP8pltlZIhROS7Z88
         z/ARWD6Uy5LCrs1vPWIdCOUoD0JxrQMnUNrBvrl8g+QEdnoB9nGKW2Ub6T1KKabNfy9H
         Oe5QacFytArUzy/+C06eexjLjAopAp20gIPwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZW3VoJVUdRiH81TcT4gskUhhWCKxzo16hLgf9fmp87Y=;
        b=MbyYSXUAT9Vv42EOJkEZjQFrjIU/PVGnbzF5QYaPhHhwRv+Vf1NmShPe4EZWE/uAUv
         9wQfC71A9yEPlL4iJ2ZXFQD0UXqHHvKeVlm1GiOad7eW+Fv6CPPRgskSUM1eI9kFlnCP
         W43n/onnngFV6WbindC9cl5RU/eobRwYslIvpTCte5AcICKootIKm2o6hrk+R9H+kabX
         FlV5UsLzsTz1w4XnKe3qCJnVFU/0yj8t3ss1fyCcCRyxSNYFakTS5C8XGJlWvhS3W47a
         SORDjMGxFdDFngBQ5kYDXx8ScTkVa1adiOgaiMQSTf6FfR482s3cqSycfkWg/zjXcVxH
         yT4g==
X-Gm-Message-State: ACrzQf1D75HbpBdH8MowbMJgB9awUz4aVrZSTXR4D1SZguppEhCSsfQv
	63Kyymumm5ZoUKSm6PLA/WRjJFuGBuR8tOe14ynalA==
X-Google-Smtp-Source: AMsMyM7V0W0g1HJnyYSSQsjkG68UgH7qMVWTvUxP6raK6LMUO9t0EOyZLMDjLL1ePBMtOfjf1Ss0XJOwDDZoo9E1fkc=
X-Received: by 2002:a25:4253:0:b0:6ca:823d:e940 with SMTP id
 p80-20020a254253000000b006ca823de940mr63189448yba.634.1668098553884; Thu, 10
 Nov 2022 08:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20221110061117.22252-1-kamlesh@ti.com>
In-Reply-To: <20221110061117.22252-1-kamlesh@ti.com>
From: Denys Dmytriyenko <denys@konsulko.com>
Date: Thu, 10 Nov 2022 11:42:23 -0500
Message-ID: <CAB2aN6MK29pOXGrB1Op5Z9wJ9kvnydQbuPhuWSVa81Z3D9WZ4Q@mail.gmail.com>
Subject: Re: [meta-ti][dunfell PATCH] optee-os: Update SRCREV for OP-TEE TRNG
 in AM62X
To: Kamlesh Gurudasani <kamlesh@ti.com>
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org, afd@ti.com, jm@ti.com, 
	j-choudhary@ti.com, reatmon@ti.com
Content-Type: multipart/alternative; boundary="000000000000c1494e05ed20755e"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Nov 2022 16:42:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15340

--000000000000c1494e05ed20755e
Content-Type: text/plain; charset="UTF-8"

This patch didn't go to the meta-ti list - are you subscribed? And since it
wasn't on the list, it didn't get picked up by Patchwork:
https://patchwork.yoctoproject.org/project/ti/list/

Denys


On Thu, Nov 10, 2022 at 1:11 AM Kamlesh Gurudasani <kamlesh@ti.com> wrote:

> Update the SRCREV to the commit when trng support was
> added in upstream OP-TEE for am62x platform to access rng.
>
> Also, enable trng support as trng support is added now in OP-TEE
>
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
>
> HS-UART-logs:
> http://serenity.dal.design.ti.com:7777/habajarafo.yaml
>
> GP-DFU-logs:
> http://serenity.dal.design.ti.com:7777/atejarexak.yaml
>
>  recipes-security/optee/optee-os_%.bbappend | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/recipes-security/optee/optee-os_%.bbappend
> b/recipes-security/optee/optee-os_%.bbappend
> index 4a4ebfd7..7047d53a 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -1,14 +1,11 @@
>  PV_ti-soc = "3.19.0+git${SRCPV}"
> -SRCREV_ti-soc = "afacf356f9593a7f83cae9f96026824ec242ff52"
> +SRCREV_ti-soc = "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
>  SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
>
>  DEPENDS_append_ti-soc = " python3-cryptography-native"
>
>  EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+
> d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>
> -EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y
> CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_WITH_SOFTWARE_PRNG=y
> CFG_TEE_CORE_LOG_LEVEL=1"
> -
>  do_compile_prepend_ti-soc() {
>      export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>  }
> --
> 2.17.1
>
>

--000000000000c1494e05ed20755e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch didn&#39;t go to the meta-ti list - are you sub=
scribed? And since it wasn&#39;t on the list, it didn&#39;t get picked up b=
y Patchwork:<div><a href=3D"https://patchwork.yoctoproject.org/project/ti/l=
ist/">https://patchwork.yoctoproject.org/project/ti/list/</a><br></div><div=
><br></div><div>Denys</div><div><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 10, 2022 at 1:11 AM K=
amlesh Gurudasani &lt;<a href=3D"mailto:kamlesh@ti.com">kamlesh@ti.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Updat=
e the SRCREV to the commit when trng support was<br>
added in upstream OP-TEE for am62x platform to access rng.<br>
<br>
Also, enable trng support as trng support is added now in OP-TEE<br>
<br>
Signed-off-by: Kamlesh Gurudasani &lt;<a href=3D"mailto:kamlesh@ti.com" tar=
get=3D"_blank">kamlesh@ti.com</a>&gt;<br>
---<br>
<br>
HS-UART-logs:<br>
<a href=3D"http://serenity.dal.design.ti.com:7777/habajarafo.yaml" rel=3D"n=
oreferrer" target=3D"_blank">http://serenity.dal.design.ti.com:7777/habajar=
afo.yaml</a><br>
<br>
GP-DFU-logs:<br>
<a href=3D"http://serenity.dal.design.ti.com:7777/atejarexak.yaml" rel=3D"n=
oreferrer" target=3D"_blank">http://serenity.dal.design.ti.com:7777/atejare=
xak.yaml</a><br>
<br>
=C2=A0recipes-security/optee/optee-os_%.bbappend | 5 +----<br>
=C2=A01 file changed, 1 insertion(+), 4 deletions(-)<br>
<br>
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/=
optee/optee-os_%.bbappend<br>
index 4a4ebfd7..7047d53a 100644<br>
--- a/recipes-security/optee/optee-os_%.bbappend<br>
+++ b/recipes-security/optee/optee-os_%.bbappend<br>
@@ -1,14 +1,11 @@<br>
=C2=A0PV_ti-soc =3D &quot;3.19.0+git${SRCPV}&quot;<br>
-SRCREV_ti-soc =3D &quot;afacf356f9593a7f83cae9f96026824ec242ff52&quot;<br>
+SRCREV_ti-soc =3D &quot;d6c5d0037b46f46caf71d67d7825d4b722cbcddf&quot;<br>
=C2=A0SRC_URI_ti-soc =3D &quot;git://<a href=3D"http://github.com/OP-TEE/op=
tee_os.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/OP-TEE/optee_os.git;protocol=3Dhttps</a>&quot;<br>
<br>
=C2=A0DEPENDS_append_ti-soc =3D &quot; python3-cryptography-native&quot;<br=
>
<br>
=C2=A0EXTRA_OEMAKE_append_k3 =3D &quot;${@ &#39;CFG_CONSOLE_UART=3D&#39;+ d=
.getVar(&#39;OPTEE_K3_USART&#39;) if d.getVar(&#39;OPTEE_K3_USART&#39;) els=
e &#39;&#39;}&quot;<br>
<br>
-EXTRA_OEMAKE_append_am62xx-evm =3D &quot; CFG_WITH_SOFTWARE_PRNG=3Dy CFG_T=
EE_CORE_LOG_LEVEL=3D1&quot;<br>
-EXTRA_OEMAKE_append_am62xx-lp-evm =3D &quot; CFG_WITH_SOFTWARE_PRNG=3Dy CF=
G_TEE_CORE_LOG_LEVEL=3D1&quot;<br>
-<br>
=C2=A0do_compile_prepend_ti-soc() {<br>
=C2=A0 =C2=A0 =C2=A0export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}<br>
=C2=A0}<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000c1494e05ed20755e--

