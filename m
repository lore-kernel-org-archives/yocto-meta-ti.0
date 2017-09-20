Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 465EEE00A9B; Wed, 20 Sep 2017 13:03:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57DD7E00970
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 13:03:20 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KK3JeZ015463
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 15:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505937799;
	bh=2YABDqWnDwTIIgecYSulvaTOYQAt3ig5w6vYwUXGz9c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=XWz6sjS9cqwbKmYzk2RaKysopGxRvczMnuwYsbGH06XSNALzVOkW9Ne686EFWMq9A
	yP4AYDg8K017KdYQsFeDIDHwOxneEiM+DjrW7TCqOevX/y0Kvtme9ZKPse6Ekhpc9C
	jh7wFFpXTReOyVVnqsxu6TIk2OFLqStbet2cO6fc=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KK3Jce004355
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 15:03:19 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Wed, 20 Sep 2017 15:03:18 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] component-meta: Adding component meta
	information
Thread-Index: AQHTMiZg9iQDj0vkhk2IxrZZDrnwTqK+hB+A//+tLAA=
Date: Wed, 20 Sep 2017 20:03:18 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F7063@DFLE12.ent.ti.com>
References: <1505921850-10668-1-git-send-email-m-radhakrishnan2@ti.com>
	<20170920195443.GY26843@edge>
In-Reply-To: <20170920195443.GY26843@edge>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] component-meta: Adding component meta information
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
X-List-Received-Date: Wed, 20 Sep 2017 20:03:21 -0000
X-Groupsio-MsgNum: 10395
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_5130E41A1BA9D145BA0F3B18D5CFB0A7437F7063DFLE12entticom_"

--_002_5130E41A1BA9D145BA0F3B18D5CFB0A7437F7063DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,
 Sorry, I thought I had not pushed the patch earlier, and missed the thread=
 (attached)
I will resolve the name, description & push this to meta-processor-sdk .

Justin,
 Can you share the description to the class?
The name is going to be 'comp-install-meta' then?

Regards
Machu.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, September 20, 2017 3:55 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] component-meta: Adding component meta inform=
ation

NAK, this has been discussed in the past...


On Wed, Sep 20, 2017 at 11:37:30AM -0400, Mahesh Radhakrishnan wrote:
> Class for adding component meta information
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  classes/component_meta.bbclass | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 classes/component_meta.bbclass
>=20
> diff --git a/classes/component_meta.bbclass=20
> b/classes/component_meta.bbclass new file mode 100644 index=20
> 0000000..f2dc754
> --- /dev/null
> +++ b/classes/component_meta.bbclass
> @@ -0,0 +1,29 @@
> +CM_NAME ?=3D ""
> +CM_VERSION ?=3D ""
> +CM_ROOT_DIR ?=3D ""
> +CM_BINARY ?=3D ""
> +CM_DESCRIPTION ?=3D ""
> +
> +do_component_meta() {
> +    if [ ! -d "${DEPLOY_DIR_IMAGE}" ]
> +    then
> +        mkdir -p ${DEPLOY_DIR_IMAGE}   =20
> +    fi
> +
> +    if [ ! -e "${DEPLOY_DIR_IMAGE}/.components_meta" ]
> +    then
> +        touch ${DEPLOY_DIR_IMAGE}/.components_meta
> +    fi
> +
> +    # Check if component is already documented in .components_meta
> +    if ! grep -q "${CM_ROOT_DIR}" ${DEPLOY_DIR_IMAGE}/.components_meta
> +    then
> +        # Add component meta information
> +        echo "${CM_NAME}|${CM_VERSION}|${CM_ROOT_DIR}|${CM_BINARY}|${CM_=
DESCRIPTION}" >> \
> +            ${DEPLOY_DIR_IMAGE}/.components_meta
> +    fi
> +}
> +
> +do_component_meta[lockfiles] =3D "${DEPLOY_DIR_IMAGE}/component_meta.loc=
k"
> +
> +addtask do_component_meta after do_install before do_package
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

--_002_5130E41A1BA9D145BA0F3B18D5CFB0A7437F7063DFLE12entticom_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Wed, 20 Sep 2017 20:03:17 GMT";
	modification-date="Wed, 20 Sep 2017 20:03:17 GMT"

Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
 DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
 14.03.0294.000; Tue, 18 Jul 2017 09:53:45 -0500
From: "Sobota, Justin" <jsobota@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
CC: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"yocto-support@list.ti.com - Arago/Yocto/OpenEmbedded/TI-SDK internal
 support (May contain non-TIers)" <yocto-support@list.ti.com>
Subject: RE: [yocto-support] Re: [meta-ti] [PATCH] component_meta: Adding
 component_meta bbclass
Thread-Topic: [yocto-support] Re: [meta-ti] [PATCH] component_meta: Adding
 component_meta bbclass
Thread-Index: AQHS9nSxiJMDZGhmBE+/lzlhL0q7a6JPmymAgAHhnQCAB5O+gIABAbOA
Date: Tue, 18 Jul 2017 14:53:45 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE14C0C8899@DFLE12.ent.ti.com>
References: <1499358417-34903-1-git-send-email-m-radhakrishnan2@ti.com>
 <20170711230503.GK10230@edge>
 <311ECDE3E284F649854AED0B108A0CE14C0C5CE3@DFLE12.ent.ti.com>
 <20170717233125.GE18367@edge>
In-Reply-To: <20170717233125.GE18367@edge>
Accept-Language: en-US
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: DLEE70.ent.ti.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, July 17, 2017 7:31 PM
> To: Sobota, Justin
> Cc: Radhakrishnan, Mahesh; yocto-support@list.ti.com -
> Arago/Yocto/OpenEmbedded/TI-SDK internal support (May contain non-
> TIers)
> Subject: Re: [yocto-support] Re: [meta-ti] [PATCH] component_meta:
> Adding component_meta bbclass
>
> Thanks, Justin,
>
> Couple followup questions:
>
> 1. Can we come up with less generic name? Maybe with "install" word in th=
e
> name? Also would be nice to have some short comment about the class at
> the beginning of the file.

How about "comp_install_meta"?

I'll add a description to the top of the class.

>
> 2. Can this be added to meta-arago instead? This sounds to me as a distro
> feature, instead of BSP one. And meta-ti is for BSP recipes and machine
> configs, while meta-arago is for apps recipes and distro configs.
>

I'm fine with this.  Machu please upstream this to meta-arago after we reso=
lve the naming and I update the class with a description.

> --
> Denys
>
>
> On Wed, Jul 12, 2017 at 11:48:48PM -0400, Sobota, Justin wrote:
> > Denys,
> >
> > This class is used by components to generate metadata which is used by
> our
> > InstallBuilder SDK creation scripts to generate the component selection
> menu
> > in the installer.  Down the road there are plans to use the metadata to
> > auto-populate some of the SDK environment setup and makefile scripts
> which
> > have component versions within them.
> >
> > Justin
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Tuesday, July 11, 2017 7:05 PM
> > > To: Radhakrishnan, Mahesh
> > > Cc: yocto-support@list.ti.com - Arago/Yocto/OpenEmbedded/TI-SDK
> internal
> > > support (May contain non-TIers)
> > > Subject: [yocto-support] Re: [meta-ti] [PATCH] component_meta:
> Adding
> > > component_meta bbclass
> > >
> > > -> internal list.
> > >
> > > No description - what's this? why is it needed?
> > >
> > >
> > > On Thu, Jul 06, 2017 at 12:26:57PM -0400, Mahesh Radhakrishnan wrote:
> > > > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > > > ---
> > > >  classes/component_meta.bbclass | 29
> > > +++++++++++++++++++++++++++++
> > > >  1 file changed, 29 insertions(+)
> > > >  create mode 100644 classes/component_meta.bbclass
> > > >
> > > > diff --git a/classes/component_meta.bbclass
> > > > b/classes/component_meta.bbclass new file mode 100644 index
> > > > 0000000..f2dc754
> > > > --- /dev/null
> > > > +++ b/classes/component_meta.bbclass
> > > > @@ -0,0 +1,29 @@
> > > > +CM_NAME ?=3D ""
> > > > +CM_VERSION ?=3D ""
> > > > +CM_ROOT_DIR ?=3D ""
> > > > +CM_BINARY ?=3D ""
> > > > +CM_DESCRIPTION ?=3D ""
> > > > +
> > > > +do_component_meta() {
> > > > +    if [ ! -d "${DEPLOY_DIR_IMAGE}" ]
> > > > +    then
> > > > +        mkdir -p ${DEPLOY_DIR_IMAGE}
> > > > +    fi
> > > > +
> > > > +    if [ ! -e "${DEPLOY_DIR_IMAGE}/.components_meta" ]
> > > > +    then
> > > > +        touch ${DEPLOY_DIR_IMAGE}/.components_meta
> > > > +    fi
> > > > +
> > > > +    # Check if component is already documented in .components_meta
> > > > +    if ! grep -q "${CM_ROOT_DIR}"
> > > ${DEPLOY_DIR_IMAGE}/.components_meta
> > > > +    then
> > > > +        # Add component meta information
> > > > +        echo
> > >
> "${CM_NAME}|${CM_VERSION}|${CM_ROOT_DIR}|${CM_BINARY}|${CM_
> > > DESCRIPTION}" >> \
> > > > +            ${DEPLOY_DIR_IMAGE}/.components_meta
> > > > +    fi
> > > > +}
> > > > +
> > > > +do_component_meta[lockfiles] =3D
> > > "${DEPLOY_DIR_IMAGE}/component_meta.lock"
> > > > +
> > > > +addtask do_component_meta after do_install before do_package
> > > > --
> > > > 1.9.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti

--_002_5130E41A1BA9D145BA0F3B18D5CFB0A7437F7063DFLE12entticom_--
